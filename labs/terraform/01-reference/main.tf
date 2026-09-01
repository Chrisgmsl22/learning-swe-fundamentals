# =============================================================================
# A 2-AZ VPC — the exact design you drew.
# Read this file top to bottom. Every block is one of 4 kinds. See variables.tf.
# =============================================================================

terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# PROVIDER — which cloud, and where. One per cloud you talk to.
provider "aws" {
  region = var.region
}

# -----------------------------------------------------------------------------
# The VPC itself
# -----------------------------------------------------------------------------

# RESOURCE — "I want this thing to exist."
#   resource "<type>" "<your name for it>" { ... }
# The type is fixed by AWS. The name is yours, and you use it to refer back.
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr # 10.0.0.0/16 -> 65,536 addresses
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.project}-vpc"
  }
}

# The single door to the internet. One per VPC.
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id # <- referring to the resource above, by type.name.attribute

  tags = {
    Name = "${var.project}-igw"
  }
}

# -----------------------------------------------------------------------------
# Subnets — 2 public, 2 private, one pair per AZ
# -----------------------------------------------------------------------------

# count = 2 makes 2 copies. count.index is 0 then 1.
resource "aws_subnet" "public" {
  count = 2

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index] # us-east-1a, then us-east-1b

  # This is what gives an instance a public IP on launch.
  # It does NOT make the subnet public — only the route table does that.
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project}-public-${var.azs[count.index]}"
    Tier = "public"
  }
}

resource "aws_subnet" "private" {
  count = 2

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "${var.project}-private-${var.azs[count.index]}"
    Tier = "private"
  }
}

# -----------------------------------------------------------------------------
# NAT gateway — lets the private subnets call OUT. Nothing may call in.
# -----------------------------------------------------------------------------

# A NAT needs a public IP of its own, so it needs an Elastic IP.
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${var.project}-nat-eip"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id

  # THE NAT SITS IN A PUBLIC SUBNET. It needs the IGW route to work at all.
  subnet_id = aws_subnet.public[0].id

  # Terraform cannot see this dependency on its own, so we say it out loud.
  depends_on = [aws_internet_gateway.main]

  tags = {
    Name = "${var.project}-nat"
  }
}

# -----------------------------------------------------------------------------
# Route tables — "I hold a packet for X. Which way out?"
# -----------------------------------------------------------------------------

# Note: the 10.0.0.0/16 -> local route is NOT written here.
# AWS adds it automatically and you cannot remove it.

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0" # everything else...
    gateway_id = aws_internet_gateway.main.id
  } # ...goes straight to the internet. THIS is what makes a subnet public.

  tags = {
    Name = "${var.project}-rt-public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id # outbound only
  }

  tags = {
    Name = "${var.project}-rt-private"
  }
}

# A route table does nothing until it is attached to a subnet.
resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = 2
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

# -----------------------------------------------------------------------------
# Security groups — the chain: internet -> alb -> app -> db
# -----------------------------------------------------------------------------

resource "aws_security_group" "alb" {
  name        = "${var.project}-alb"
  description = "Public entry point. HTTPS from anywhere."
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTPS from the internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # No inline egress here. sg-alb points at sg-app and sg-app points back at
  # sg-alb, which Terraform reads as a dependency cycle. Breaking one direction
  # out into its own resource fixes it. This is a normal, real-world pattern.

  tags = {
    Name = "${var.project}-sg-alb"
  }
}

resource "aws_security_group_rule" "alb_to_app" {
  type                     = "egress"
  description              = "ALB reaches the app tier only"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.app.id
}

resource "aws_security_group" "app" {
  name        = "${var.project}-app"
  description = "App tier. Reachable only from the load balancer."
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "From the ALB only"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    # Referencing a security group, not an IP range. Instances come and go;
    # this rule keeps working when they do.
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    description = "Outbound, via the NAT"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-sg-app"
  }
}

resource "aws_security_group" "db" {
  name        = "${var.project}-db"
  description = "Database. Reachable only from the app tier."
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Postgres from the app tier only"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.app.id]
  }

  # No egress block at all. A security group is stateful, so replies to an
  # allowed request go back out with no rule needed.

  tags = {
    Name = "${var.project}-sg-db"
  }
}

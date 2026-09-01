
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

# --- The VPC itself ---

# RESOURCE — "I want this thing to exist."
#   resource "<type>" "<your name for it>" { ... }
# The type is fixed by AWS. The name is yours, and you use it to refer back.
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.project}-vpc"
  }
}

# The single door to the internet. One per VPC.
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project}-igw"
  }
}

# --- Subnets — 2 public, 2 private, one pair per AZ ---

resource "aws_subnet" "public" {
  count = 2

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

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

# --- NAT gateway — lets the private subnets call OUT. Nothing may call in. ---

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${var.project}-nat-eip"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id # Which EIP to use as its public IP

  subnet_id = aws_subnet.public[0].id

  depends_on = [aws_internet_gateway.main]

  tags = {
    Name = "${var.project}-nat"
  }
}

# --- Route tables — "I hold a packet for X. Which way out?" ---

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.project}-rt-public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "${var.project}-rt-private"
  }
}

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

# --- Security groups — the chain: internet -> alb -> app -> db ---

resource "aws_security_group" "alb" {
  name        = "${var.project}-alb"
  description = "Public entry point. HTTPS from anywhere."
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTPS from the internet"
    from_port  = 443
    to_port    = 443
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All outbound"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

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
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    description = "SSH for debugging"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Should use 1 IP instead
  }

  egress {
    description = "Outbound, via the NAT"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    #cidr_blocks = ["0.0.0.0/0"] ## Hmm, is this correct?
    security_groups = [ aws_security_group.app.id ]
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
    description = "Postgres"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.app.id]
  }

  tags = {
    Name = "${var.project}-sg-db"
  }
}

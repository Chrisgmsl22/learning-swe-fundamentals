
variable "project" {
  description = "Name prefix for every resource."
  type        = string
  default     = "cloudprep"
}

variable "region" {
  description = "AWS region to build in."
  type        = string
  default     = "us-east-1"
}

variable "azs" {
  description = "The 2 availability zones. A subnet lives in exactly 1 AZ."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "vpc_cidr" {
  description = "The whole VPC range. 65,536 addresses."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnets, one per AZ."
  type        = list(string)
  default     = ["10.0.0.0/18", "10.0.63.0/18"] # Do we need to add 255?
}

variable "private_subnet_cidrs" {
  description = "Private subnets, one per AZ."
  type        = list(string)
  default     = ["10.0.64.0/18", "10.0.192.0/18"]
}

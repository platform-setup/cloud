provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
}

################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "../sources"

  name = "simple-example"
  cidr = "10.0.0.0/16"

  azs             = ["${local.region}a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_ipv6 = true

  enable_nat_gateway = false
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "phat"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-name"
  }
}
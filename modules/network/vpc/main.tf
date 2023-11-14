resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge( {
    Name = var.name
  }, var.vpc_tags)
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge({
    Name = "${var.name} Internet Gateway"
  }, var.vpc_tags)
}

variable "name" {
  description = "The VPC name"
}

variable "vpc_cidr_block" {
  description = "CIDR block of the vpc"
  type = string
}

variable "vpc_tags" {
  description = "Tags of the vpc"
}
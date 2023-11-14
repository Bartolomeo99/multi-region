variable "Environment" {}
variable "cidr_block" {}
variable "tags" {}
variable "name" {}

variable "private_cidr_block" {
  type = list(string)
}

variable "public_cidr_block" {
  type = list(string)
}

variable "av_zones" {
  type = list(string)
}

variable "region" {
  type = string

  validation {
    condition     = can(regex("^eu", var.region))
    error_message = "Unsupported AWS region. Only European AWS regions (starting with 'eu') are supported."
  }
}

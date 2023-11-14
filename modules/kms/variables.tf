variable "region" {
  type = string

  validation {
    condition     = can(regex("^eu", var.region))
    error_message = "Unsupported AWS region. Only European AWS regions (starting with 'eu') are supported."
  }
}

variable "name" {
  description = "The KMS name"
}

variable "tags" {
  description = "The KMS name"
}
variable "tags" {}
variable "bucket_name" {}
variable "kms_id" {}

variable "region" {
  type = string

  validation {
    condition     = can(regex("^eu", var.region))
    error_message = "Unsupported AWS region. Only European AWS regions (starting with 'eu') are supported."
  }
}

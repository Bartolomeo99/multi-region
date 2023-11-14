variable "subnet_ids" {}
variable "vpc_id" {}
variable "name" {}

variable "route" {
  description = "List of route configurations"
  type        = list(object({
    cidr_block     = string
    gateway_id     = string
  }))
}

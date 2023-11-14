variable "Environment" {}
variable "public" {}
variable "cidrs" {
    type = list(string)
}
variable "vpc_id" {}
variable "availability_zones" {}
variable "tags" {
    type = map(string)
    default = {
        Type = "AWS"
        Created_by = "TF"
    }
}

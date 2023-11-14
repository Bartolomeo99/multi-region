variable "name" {
  description = "The NAT name"
}

variable "tags" {
    type = map(string)
    default = {
        Type = "AWS",
        Created_by = "TF"
    }
}

variable "nat_subnet" {
  
}
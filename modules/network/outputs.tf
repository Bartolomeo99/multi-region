output "private_subnets" {
  value = module.private_subnets.ids
}

output "public_subnets" {
  value = module.public_subnets.ids
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "igw" {
  value = module.vpc.igw_id
}

output "nat_gateway_id" {
  value = module.nat_gateway.nat_gateway_id
}

output "nat_eip_id" {
  value = module.nat_gateway.nat_eip_id
}

output "public_rtb" {
  value = module.rtb.rtb_id
}

output "private_rtb" {
  value = module.private_rtb.rtb_id 
  }
  
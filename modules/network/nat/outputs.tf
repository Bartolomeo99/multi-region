output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}

output "nat_eip_id" {
  value = aws_eip.nat_eip.id
}
resource "aws_eip" "nat_eip" {
  tags = merge({
     Name = "${var.name} EIP-NGW"
  }, var.tags)
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = var.nat_subnet
  tags = merge({
    Name = "${var.name} NGW"
  }, var.tags)
}

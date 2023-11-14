resource "aws_route_table" "rtb" {
  vpc_id = var.vpc_id
  dynamic "route" {
    for_each = var.route

    content {
      cidr_block  = route.value.cidr_block
      gateway_id  = route.value.gateway_id
    }
  }
  tags = {
    Name = "${var.name}-Route-Table"
  }
}

resource "aws_route_table_association" "rtb" {
  count          = length(var.subnet_ids)
  subnet_id      = element(var.subnet_ids, count.index)
  route_table_id = aws_route_table.rtb.id
}

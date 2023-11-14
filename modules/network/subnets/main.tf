resource "aws_subnet" "subnet" {
  count = length(var.cidrs)
  vpc_id = var.vpc_id
  cidr_block = var.cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    var.tags,
      {
        "Name" = "${var.public ? "Public" : "Private"}-Subnet-${count.index + 1}",
        "Environment" = var.Environment
      }
  )
}

# Elastic IP
resource "aws_eip" "eip_nat" {
  vpc = true
  associate_with_private_ip = "${element(var.private_subnet_cidr, count.index)}"
  count = "${length(var.private_subnet_cidr)}"
}


# NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = "${element(aws_eip.eip_nat.*.id, count.index)}"
  count = "${length(var.private_subnet_cidr)}"

  subnet_id     = "${element(var.private_subnet_ids, count.index)}"
  count = "${length(var.private_subnet_cidr)}"

  tags = {
    Name = "NAT-${var.environment}-${var.project}"
  }
}
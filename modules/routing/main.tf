# Public route table 
resource "aws_route_table" "route_table_public" {
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "RT-PUB-${var.environment}-${var.project}"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id = "${element(var.public_subnet_ids, count.index)}"
  count = "${length(var.public_subnet_cidr)}"
  route_table_id = "${aws_route_table.route_table_public.id}"
}

resource "aws_route" "route" {
    route_table_id = "${aws_route_table.route_table_public.id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${var.igw_id}"
}

# Private route table 1
resource "aws_route_table" "route_table_private1" {
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "RT-PRIV-${var.environment}-${var.project}"
  }
}

resource "aws_route_table_association" "rta_private1" {
  subnet_id      = "${var.private_subnet_ids[0]}"
  route_table_id = "${aws_route_table.route_table_private1.id}"
}

resource "aws_route" "route_private1" {
    route_table_id = "${aws_route_table.route_table_private1.id}"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${var.nat_id[0]}"

}

#Private route table 2
resource "aws_route_table" "route_table_private2" {
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "RT-PRIV-${var.environment}-${var.project}"
  }
}

resource "aws_route_table_association" "rta_private2" {
  subnet_id      = "${var.private_subnet_ids[1]}"
  route_table_id = "${aws_route_table.route_table_private2.id}"
}

resource "aws_route" "route_private2" {
    route_table_id = "${aws_route_table.route_table_private2.id}"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${var.nat_id[1]}"
}

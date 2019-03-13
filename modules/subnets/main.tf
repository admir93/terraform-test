# Define public subnet
resource "aws_subnet" "public_subnet" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${element(var.public_subnet_cidr, count.index)}"
    count = "${length(var.public_subnet_cidr)}"
    availability_zone = "${element(var.availability_zones, count.index)}"
    count = "${length(var.availability_zones)}"
    
    tags = {
        Name = "SB-PUB-${var.environment}-${var.project}"
    }
}

# Define private subnet
resource "aws_subnet" "private_subnet" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${element(var.private_subnet_cidr, count.index)}"
    count = "${length(var.private_subnet_cidr)}"
    availability_zone = "${element(var.availability_zones, count.index)}"
    count = "${length(var.availability_zones)}"

    tags = {
      Name = "SB-PRIV-${var.environment}-${var.project}"
    }
}
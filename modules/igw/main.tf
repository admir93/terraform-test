# Define the internet gateway
resource "aws_internet_gateway" "igw_test" {
    vpc_id = "${var.vpc_id}"

    tags = {
        Name = "IGW-${var.environment}-${var.project}"
    }
}
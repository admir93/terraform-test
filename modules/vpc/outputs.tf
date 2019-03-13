output "vpc_id" {
    value = "${aws_vpc.vpc_test.id}"
}

output "vpc_cidr" {
    value = "${aws_vpc.vpc_test.cidr_block}"
}
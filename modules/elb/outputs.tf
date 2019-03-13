output "elb_name" {
    value = "${aws_elb.elb-test.name}"
}

output "elb_dns_name" {
    value = "${aws_elb.elb-test.dns_name}"
}

output "elb_zone_id" {
    value = "${aws_elb.elb-test.zone_id}"
}
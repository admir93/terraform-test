output "sg_elb_ids" {
    value = "${aws_security_group.sg_elb.id}"
}

output "sg_rds_ids" {
    value = "${aws_security_group.sg_rds.id}"
}

output "sg_bastion_ids" {
    value = "${aws_security_group.sg_bastion.id}"
}

output "sg_as_ids" {
    value = "${aws_security_group.sg_auto_scalling_group.id}"
}
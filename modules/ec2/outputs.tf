output "ec2_ids" {
    value = "${aws_instance.ec2_instance.id}"
}

output "bastion_public_ip" {
    value = "${aws_eip.eip_bastion.public_ip}"
}

output "bastion_private_ip" {
    value = "${aws_eip.eip_bastion.private_ip}"
}
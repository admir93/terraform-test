output "ec2_ids" {
    value = "${module.ec2.ec2_ids}"
}

output "ec2_public_ip" {
    value = "${module.ec2.bastion_public_ip}"
}

output "vpc_id" {
    value = "${module.vpc.vpc_id}"
}

output "vpc_cidr" {
    value = "${module.vpc.vpc_cidr}"
}

output "public_subnet_ids" {
    value = "${module.subnets.public_subnet_ids}"
}

output "private_subnet_ids" {
    value = "${module.subnets.private_subnet_ids}"
}

output "public_subnet_cidr" {
    value = "${module.subnets.public_subnet_cidr}"
}

output "private_subnet_cidr" {
    value = "${module.subnets.private_subnet_cidr}"
}

output "lc_id" {
    value = "${module.asg.lc_id}"
}

output "asg_id" {
    value = "${module.asg.asg_id}"
}

output "asg_name" {
    value = "${module.asg.asg_name}"
}
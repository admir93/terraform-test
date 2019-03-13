output "lc_id" {
    value = "${aws_launch_configuration.lc_config.id}"
}

output "asg_id" {
    value = "${aws_autoscaling_group.asg_config.id}"
}

output "asg_name" {
    value = "${aws_autoscaling_group.asg_config.name}"
}
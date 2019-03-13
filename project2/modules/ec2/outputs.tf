output "webapp_ec2_ids" {
    value = "${aws_instance.web_app_ec2.id}"
}
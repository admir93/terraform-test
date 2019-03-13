output "ami_id" {
    value = "${aws_ami_from_instance.web_app_ami.id}"
}
resource "random_string" "default" {
  length = 5
  upper = false
  lower = true
  number = true
  special = false
}

resource "aws_ami_from_instance" "web_app_ami" {
  name  = "ami-${var.environment}-${var.project}-${random_string.default.result}"
  source_instance_id = "${var.webapp_ec2_id}"
  snapshot_without_reboot = true

  tags = {
      Name = "ami-${var.environment}-${var.project}-${timestamp()}"
  }
}
resource "aws_ami_from_instance" "web_app_ami" {
  name  = "ami-${var.environment}-${var.project}-${var.new_ami}"
  source_instance_id = "${var.webapp_ec2_id}"
  snapshot_without_reboot = true

  tags = {
      Name = "ami-${var.environment}-${var.project}-${var.new_ami}"
  }
}
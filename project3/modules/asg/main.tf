resource "aws_launch_configuration" "lc_config" {
  name          = "LC-${var.environment}-${var.project}-${var.new_ami}"
  image_id      = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  security_groups = ["${var.sg_ids}"]
  key_name = "${var.key_name}"


  lifecycle {
    create_before_destroy = true
    ignore_changes = true
  }
}

resource "null_resource" "update_asg3" {
  provisioner "local-exec" {
    command = <<EOF
    aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${var.asg_name} --launch-configuration-name ${aws_launch_configuration.lc_config.name} --desired-capacity 4 --termination-policies "OldestInstance";
    sleep 60;
    aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${var.asg_name} --launch-configuration-name ${aws_launch_configuration.lc_config.name} --desired-capacity 2 --termination-policies "OldestInstance";
    EOF
  }
}

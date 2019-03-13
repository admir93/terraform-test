resource "aws_ami_from_instance" "ec2_lc" {
  name               = "AMI-LC-${var.environment}-${var.project}"
  source_instance_id = "${var.ec2_ids}"

  lifecycle {
    ignore_changes = true
  }
}


resource "aws_launch_configuration" "lc_config" {
  name          = "LC-${var.environment}-${var.project}"
  image_id      = "${aws_ami_from_instance.ec2_lc.id}"
  instance_type = "${var.instance_type}"
  security_groups = ["${var.sg_as_ids}"]
  key_name = "${var.key_name}"

  lifecycle {
    ignore_changes = true
  }
}

resource "aws_autoscaling_group" "asg_config" {
    name = "asg-${var.environment}-${var.project}"
    launch_configuration = "${aws_launch_configuration.lc_config.id}"
    min_size = 1
    max_size = 6
    desired_capacity = 2
    availability_zones = ["${var.availability_zones}"]
    vpc_zone_identifier = ["${var.private_subnet_ids}"]
    load_balancers = ["${var.elb_name}"]
    health_check_type = "EC2"
    health_check_grace_period = 300

  tags = {
    key = "Name"
    value = "ASG-${var.environment}-${var.project}"
    propagate_at_launch = true
  }

  lifecycle {
    ignore_changes = true
  }

}
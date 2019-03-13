# EC2
resource "aws_instance" "ec2_instance" {
    ami = "ami-05af84768964d3dc0"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    subnet_id = "${var.public_subnet_ids[0]}"
    vpc_security_group_ids = ["${var.sgids}"]
    associate_public_ip_address = true
    
  tags = {
    Name = "EC2-${var.environment}-${var.project}"
  }
}

# Elastic IP
resource "aws_eip" "eip_bastion" {
  vpc = true
  instance = "${aws_instance.ec2_instance.id}"
}
# EC2
resource "aws_instance" "web_app_ec2" {
    ami = "ami-0880e49a81234ac0f"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    subnet_id = "${var.public_subnet_ids2[0]}"
    vpc_security_group_ids = ["${var.sgids}"]
    associate_public_ip_address = true
    
  tags = {
    Name = "Jenkins-${var.environment}-${var.project}"
  }
}

# Elastic IP
resource "aws_eip" "eip_jenkins" {
  vpc = true
  instance = "${aws_instance.web_app_ec2.id}"
}
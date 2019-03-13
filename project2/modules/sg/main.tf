# ELB Security Group
resource "aws_security_group" "sg_ec2" {
  name        = "SG-Jenkins-${var.environment}-${var.project}"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${var.vpc_id2}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_blocks_sg}"]
  }
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_blocks_sg}"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


# AWS Provider
profile = "default"
aws_region = "eu-central-1"
availability_zones = ["eu-central-1a","eu-central-1b"]

# VPC
vpc_cidr = "10.0.0.0/16"
public_subnet_cidr = ["10.0.10.0/24", "10.0.40.0/24"]
private_subnet_cidr = ["10.0.20.0/24", "10.0.30.0/24"]
cidr_blocks_sg = ["77.221.1.49/32"]
project = "tf"
environment = "dev"

# EC2
instance_type = "t2.micro"
key_name = "admir-ec2"

# S3
user_arn = "arn:aws:iam::926158554750:user/admir.osmanovic"

# RDS
db_username = "admir"
db_password = "Admir123!"
db_port = "3306"

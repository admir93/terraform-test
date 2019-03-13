# Variables

variable "project" {}

variable "environment" {}

variable "profile" {}

variable "aws_region" {}

variable "vpc_cidr" {}

variable "public_subnet_cidr" {
    type = "list"
}

variable "private_subnet_cidr" {
    type = "list"
}

variable "cidr_blocks_sg" {
    type = "list"
}

variable "instance_type" {}

variable "key_name" {}

variable "availability_zones" {
    type = "list"
}

variable "user_arn" {}

variable "db_username" {}

variable "db_password" {}

variable "db_port" {}
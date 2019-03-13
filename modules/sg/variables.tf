variable "project" {}

variable "environment" {}

variable "vpc_id" {}

variable "cidr_blocks_sg" {
    type = "list"
}

variable "private_subnet_cidr" {
    type = "list"
}

variable "bastion_public_ip" {}

variable "bastion_private_ip" {}
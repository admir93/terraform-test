variable "project" {}

variable "environment" {}

variable "elb_name" {
        type = "list"
}

variable "private_subnet_ids" {
        type = "list"
}

variable "instance_type" {}

variable "ec2_ids" {}

variable "availability_zones" {
        type = "list"
}

variable "key_name" {}

variable "sg_as_ids" {}
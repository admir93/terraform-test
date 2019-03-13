variable "vpc_id" {}

variable "public_subnet_cidr" {
    type = "list"
}

variable "private_subnet_cidr" {
    type = "list"
}

variable "availability_zones" {
    type = "list"
}

variable "project" {}

variable "environment" {}

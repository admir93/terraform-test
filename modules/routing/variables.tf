variable "vpc_id" {}

variable "project" {}

variable "environment" {}

variable "public_subnet_ids" {
    type = "list"
}

variable "private_subnet_ids" {
    type = "list"
}

variable "igw_id" {}

variable "nat_id" {
    type = "list"
}

variable "public_subnet_cidr" {
    type = "list"
}
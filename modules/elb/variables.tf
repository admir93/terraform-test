variable "project" {}

variable "environment" {}

variable "ec2_ids" {}

variable "public_subnet_ids" {
    type = "list"
}

variable "sgids" {}

variable "acm_ssl_id" {}
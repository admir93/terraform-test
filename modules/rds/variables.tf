variable "project" {}

variable "environment" {}

variable "db_username" {}

variable "db_password" {}

variable "db_port" {}

variable "sg_rds_ids" {
    type = "list"
}

variable "public_subnet_ids" {
    type = "list"
}


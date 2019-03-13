# Define AWS as provider
provider "aws" {
    profile = "${var.profile}"
    region = "${var.aws_region}"
}

terraform {
 backend "s3" {
   bucket = "admir-state"
   key    = "project2/admir-test.tfstate"
   region = "eu-central-1"
 }
}

data "terraform_remote_state" "network" {
 backend = "s3"
 config = {
   bucket = "admir-state"
   key    = "project1/admir-test.tfstate"
   region = "eu-central-1"
 }
}

module "sg" {
  source = "modules/sg"

  vpc_id2 = "${data.terraform_remote_state.network.vpc_id}"
  project = "${var.project}"
  environment = "${var.environment}"
  cidr_blocks_sg = "${var.cidr_blocks_sg}"

}

module "ec2" {
  source = "modules/ec2"

  project = "${var.project}"
  environment = "${var.environment}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}" 
  public_subnet_ids2 = "${data.terraform_remote_state.network.public_subnet_ids}"
  sgids = "${module.sg.sgids}"
}


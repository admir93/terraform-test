# Define AWS as provider
provider "aws" {
    profile = "${var.profile}"
    region = "${var.aws_region}"
}

terraform {
 backend "s3" {
   bucket = "admir-state"
   key    = "project3/admir-test.tfstate"
   region = "eu-central-1"
 }
}

data "terraform_remote_state" "project1" {
 backend = "s3"
 config = {
   bucket = "admir-state"
   key    = "project1/admir-test.tfstate"
   region = "eu-central-1"
 }
}

data "terraform_remote_state" "project2" {
 backend = "s3"
 config = {
   bucket = "admir-state"
   key    = "project2/admir-test.tfstate"
   region = "eu-central-1"
 }
}


module "ami" {
  source = "modules/ami"

  webapp_ec2_id = "${data.terraform_remote_state.project2.webapp_ec2_id}"
  project = "${var.project}"
  environment = "${var.environment}"
  new_ami = "${var.new_ami}"
}

module "asg" {
  source = "modules/asg"

  sg_ids = "${data.terraform_remote_state.project2.sg_ids}"
  ami_id = "${module.ami.ami_id}"

  project = "${var.project}"
  environment = "${var.environment}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  asg_name = "${data.terraform_remote_state.project1.asg_name}"
  new_ami = "${var.new_ami}"

}

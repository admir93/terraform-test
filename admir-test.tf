# Define AWS as provider
provider "aws" {
    profile = "${var.profile}"
    region = "${var.aws_region}"
}

terraform {
 backend "s3" {
   bucket = "admir-state"
   key    = "project1/admir-test.tfstate"
   region = "eu-central-1"
 }
}



module "vpc" {
  source = "modules/vpc"

  vpc_cidr = "${var.vpc_cidr}"
  project = "${var.project}"
  environment = "${var.environment}"

}
   
module "subnets" {
  source = "modules/subnets"

  vpc_id = "${module.vpc.vpc_id}"
  public_subnet_cidr = "${var.public_subnet_cidr}"
  private_subnet_cidr = "${var.private_subnet_cidr}"
  project = "${var.project}"
  environment = "${var.environment}"
  availability_zones = ["${var.availability_zones}"]
}

module "igw" {
  source = "modules/igw"

  vpc_id = "${module.vpc.vpc_id}"
  project = "${var.project}"
  environment = "${var.environment}"
}


module "nat" {
  source = "modules/nat"

  private_subnet_cidr = ["${var.private_subnet_cidr}"]
  private_subnet_ids = ["${module.subnets.private_subnet_ids}"]
  project = "${var.project}"
  environment = "${var.environment}"
}

module "routing" {
  source = "modules/routing"

  vpc_id = "${module.vpc.vpc_id}"
  project = "${var.project}"
  environment = "${var.environment}"
  public_subnet_ids = "${module.subnets.public_subnet_ids}"
  private_subnet_ids = "${module.subnets.private_subnet_ids}"
  igw_id = "${module.igw.igw_id}"
  nat_id = "${module.nat.nat_id}"
  public_subnet_cidr = "${var.public_subnet_cidr}"
}

module "sg" {
  source = "modules/sg"

  vpc_id = "${module.vpc.vpc_id}"
  project = "${var.project}"
  environment = "${var.environment}"
  cidr_blocks_sg = "${var.cidr_blocks_sg}"
  private_subnet_cidr = "${var.private_subnet_cidr}"
  bastion_public_ip = "${module.ec2.bastion_public_ip}"
  bastion_private_ip = "${module.ec2.bastion_private_ip}"
}

module "ec2" {
  source = "modules/ec2"

  project = "${var.project}"
  environment = "${var.environment}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}" 
  public_subnet_ids = "${module.subnets.public_subnet_ids}"
  sgids = "${module.sg.sg_bastion_ids}"
}

module "acm" {
  source = "modules/acm"

}

module "elb" {
  source = "modules/elb"

  project = "${var.project}"
  environment = "${var.environment}"
  ec2_ids = "${module.ec2.ec2_ids}"
  public_subnet_ids = "${module.subnets.public_subnet_ids}"
  sgids = "${module.sg.sg_elb_ids}"
  acm_ssl_id = "${module.acm.acm_ssl_id}"
}

module "asg" {
    source = "modules/asg"

    project = "${var.project}"
    environment = "${var.environment}"
    elb_name = ["${module.elb.elb_name}"]
    private_subnet_ids = ["${module.subnets.private_subnet_ids}"]
    instance_type = "${var.instance_type}"
    ec2_ids = "${module.ec2.ec2_ids}"
    availability_zones = ["${var.availability_zones}"]
    sg_as_ids = "${module.sg.sg_as_ids}"
    key_name = "${var.key_name}"

}

module "r53" {
  source = "modules/r53"

  elb_dns_name = "${module.elb.elb_dns_name}"
  elb_zone_id = "${module.elb.elb_zone_id}"
}

module "s3" {
  source = "modules/s3"

  project = "${var.project}"
  environment = "${var.environment}"
  user_arn = "${var.user_arn}"

}

module "rds" {
  source = "modules/rds"

  project = "${var.project}"
  environment = "${var.environment}"
  db_username = "${var.db_username}"
  db_password = "${var.db_password}"
  db_port = "${var.db_port}"
  sg_rds_ids = ["${module.sg.sg_rds_ids}"]
  public_subnet_ids = "${module.subnets.public_subnet_ids}"
  
}
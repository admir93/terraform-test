resource "aws_db_subnet_group" "sb_group" {
    name = "db-sbg-${var.environment}-${var.project}"
    subnet_ids = ["${var.public_subnet_ids}"]
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.6.40"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  identifier           = "db-${var.environment}-${var.project}"
  skip_final_snapshot = true
  username             = "${var.db_username}"
  password             = "${var.db_password}"
  port                 = "${var.db_port}"
  parameter_group_name = "default.mysql5.6"

  vpc_security_group_ids = ["${var.sg_rds_ids}"]
  db_subnet_group_name = "db-sbg-${var.environment}-${var.project}"
  publicly_accessible = false
  multi_az = false
}
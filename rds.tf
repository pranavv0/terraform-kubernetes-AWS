provider "aws" {
  region     = "ap-south-1"
  profile    = "ver2"
}

resource "aws_db_subnet_group" "default" {
  name       = "rds"
  subnet_ids = ["subnet-39ed1729", "subnet-bd227egf"]

  tags = {
    Name = "My DB subnet group"
  }
}
resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7.30"
  instance_class       = "db.t2.micro"
  name                 = "rds"
  username             = "root"
  password             = "root"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "${aws_db_subnet_group.default.name}"
  publicly_accessible = true
  iam_database_authentication_enabled = true

tags = {
    Name  = "mysql_db_for_wp"
}
}

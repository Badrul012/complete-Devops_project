provider "aws" {
  region = var.region
}

resource "aws_db_subnet_group" "database_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "database_instance" {
  allocated_storage    = var.db_allocated_storage
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.database_subnet_group.name

  tags = {
    Environment = var.environment
  }
}

output "database_instance_endpoint" {
  value = aws_db_instance.database_instance.endpoint
}

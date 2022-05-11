# ---------------------------------------------
#           Create RDS Instance
# ---------------------------------------------

resource "aws_db_instance" "default" {
  allocated_storage      = var.allocated_storage
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  multi_az               = false
  name                   = var.db_name
  username               = var.username
  password               = var.password
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}

resource "aws_db_subnet_group" "default" {
  name       = var.db_subnet_group_name
  subnet_ids = [aws_subnet.database-subnet-1.id,aws_subnet.database-subnet-2.id]
  tags = {
    Name = "DB subnet group"
  }
}

resource "aws_db_subnet_group" "main" {
  name = "${var.project_name}-db-subnet-group"

  subnet_ids = [
    aws_subnet.private.id,
    aws_subnet.private_2.id
  ]

  tags = {
    Name        = "${var.project_name}-db-subnet-group"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_db_instance" "main" {
  identifier = "${var.project_name}-mysql"

  allocated_storage = 20
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"

  db_name  = "appdb"
  username = "admin"
  password = var.db_password

  publicly_accessible    = false
  multi_az               = false
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name        = "${var.project_name}-mysql"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

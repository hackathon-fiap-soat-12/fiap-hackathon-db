resource "aws_security_group" "rds_security_group" {
  name        = var.rds_security_group_name
  description = "Security group for RDS PostgreSQL from the TechChallenge APP"
  vpc_id      = data.aws_vpc.selected_vpc.id

  ingress {
    from_port = 5432
    to_port   = 5432
    protocol  = "tcp"
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.rds_subnet_group_name
  subnet_ids = [for subnet in data.aws_subnet.selected_subnets : subnet.id]
}

resource "aws_db_instance" "sonarqube_db_postgres" {
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = "13"
  instance_class         = "db.t3.micro"
  identifier             = var.sonarqube_db_rds_identifier
  db_name                = var.sonarqube_db_name
  username               = var.sonarqube_db_username
  password               = var.sonarqube_db_password
  parameter_group_name   = "default.postgres13"
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name

  skip_final_snapshot = true

  depends_on = [
    aws_security_group.rds_security_group,
    aws_db_subnet_group.rds_subnet_group,
  ]
}
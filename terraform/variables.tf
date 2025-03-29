variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Account Region"
}

variable "iam_role_name" {
  type        = string
  default     = "LabRole"
  description = "IAM Role Name"
}

variable "vpc_name" {
  type        = string
  default     = "fiap-hackathon-vpc"
  description = "Private VPC name"
}

variable "elasticache_security_group_name" {
  type        = string
  default     = "fiap-hackathon-elasticache-sg"
  description = "Elasticache Security Group name"
}


variable "elasticache_subnet_group_name" {
  type        = string
  default     = "fiap-hackathon-elasticache-subnet-group"
  description = "Elasticache Subnet Group name"
}

variable "rds_security_group_name" {
  type        = string
  default     = "fiap-hackathon-rds-sg"
  description = "RDS Security Group name"
}

variable "rds_subnet_group_name" {
  type        = string
  default     = "fiap-hackathon-rds-subnet-group"
  description = "Subnet Group name"
}

variable "sonarqube_db_rds_identifier" {
  type        = string
  default     = "fiap-hackathon-sonarqube-db"
  description = "RDS database identifier"
}

variable "sonarqube_db_credentials_secret_name" {
  type        = string
  default     = "fiap-hackathon-sonarqube-db-credentials"
  description = "AWS Secrets Manager secret name"
}

variable "sonarqube_db_username" {
  type        = string
  description = "Database username"
  sensitive   = true
}

variable "sonarqube_db_password" {
  type        = string
  description = "Database password"
  sensitive   = true
}

variable "sonarqube_db_name" {
  type        = string
  description = "Database name"
  sensitive   = false
}


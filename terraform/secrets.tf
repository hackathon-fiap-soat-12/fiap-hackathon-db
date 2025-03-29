resource "aws_secretsmanager_secret" "sonarqube_db_credentials_secret" {
  name        = var.sonarqube_db_credentials_secret_name
  description = "Database credentials for SonarQube db PostgreSQL RDS Instance from Techchallenge APP"

  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "sonarqube_db_credentials_secret_version" {
  secret_id = aws_secretsmanager_secret.sonarqube_db_credentials_secret.id

  secret_string = jsonencode({
    db_username = var.sonarqube_db_username
    db_password = var.sonarqube_db_password
    db_name     = var.sonarqube_db_name
  })

  depends_on = [aws_secretsmanager_secret.sonarqube_db_credentials_secret]
}

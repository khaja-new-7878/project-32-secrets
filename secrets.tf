resource "aws_secretsmanager_secret" "db_secret" {
  name        = "mydb/credentials"
  description = "Database credentials for Project 32"
}

resource "aws_secretsmanager_secret_version" "db_secret_value" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = "admin"
    password = "SuperSecret123!"
  })
}


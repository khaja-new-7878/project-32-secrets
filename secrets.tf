resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_secretsmanager_secret" "db_secret" {
  name        = "mydb/credentials-${random_id.suffix.hex}"
  description = "Database credentials for Project 32"
}

resource "aws_secretsmanager_secret_version" "db_secret_value" {
  secret_id = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = "admin"
    password = "SuperSecret123!"
  })
}


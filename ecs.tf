secrets = [
  {
    name      = "DB_USER"
    valueFrom = "${aws_secretsmanager_secret.db_secret.arn}:username::"
  },
  {
    name      = "DB_PASSWORD"
    valueFrom = "${aws_secretsmanager_secret.db_secret.arn}:password::"
  }
]


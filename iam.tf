resource "aws_iam_policy" "secrets_policy" {
  name        = "lambda-secrets-policy"
  description = "Allow ECS/Lambda to read secrets from Secrets Manager"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "secretsmanager:GetSecretValue"
        ]
        Resource = aws_secretsmanager_secret.db_secret.arn
      }
    ]
  })
}


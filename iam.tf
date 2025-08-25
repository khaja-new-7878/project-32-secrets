resource "aws_iam_role" "ecs_task_role" {
  name = "ecs-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

# Policy to allow ECS to read secrets
resource "aws_iam_policy" "secrets_policy" {
  name        = "ecs-secrets-policy"
  description = "Allow ECS to read secrets from Secrets Manager"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["secretsmanager:GetSecretValue"]
        Resource = aws_secretsmanager_secret.db_secret.arn
      }
    ]
  })
}

# Attach secrets policy to ECS task role
resource "aws_iam_role_policy_attachment" "ecs_secret_attach" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = aws_iam_policy.secrets_policy.arn
}

# 🔹 NEW: Allow ECS Exec (Session Manager)
resource "aws_iam_role_policy_attachment" "ecs_ssm_attach" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}


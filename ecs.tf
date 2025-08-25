resource "aws_ecs_task_definition" "project32_task" {
  family                   = "project32-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = aws_iam_role.ecs_task_role.arn
  task_role_arn      = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([
    {
      name      = "app"
      image     = "nginx:latest"
      essential = true

      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]

      secrets = [
        {
          name      = "DB_SECRET"
          valueFrom = aws_secretsmanager_secret.db_secret.arn
        }
      ]
    }
  ])
}


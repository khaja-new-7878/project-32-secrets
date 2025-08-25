# ECS Cluster
resource "aws_ecs_cluster" "project32_cluster" {
  name = "project32-cluster"
}

# ECS Service to run the task
resource "aws_ecs_service" "project32_service" {
  name            = "project32-service"
  cluster         = aws_ecs_cluster.project32_cluster.id
  task_definition = aws_ecs_task_definition.project32_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  # 🔹 Required for ECS Exec (aws ecs execute-command)
  enable_execute_command = true

  network_configuration {
    subnets          = ["subnet-0b55d9cd54c5877bf"] # replace with your subnet
    security_groups  = [aws_security_group.ecs.id]
    assign_public_ip = true
  }
}

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

  network_configuration {
    subnets          = [aws_subnet.public.id]      # Replace with your subnet ID(s)
    security_groups  = [aws_security_group.ecs.id] # Replace with your SG
    assign_public_ip = true
  }
}


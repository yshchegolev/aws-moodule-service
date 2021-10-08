locals {
  container_definitions = jsonencode([
    {
      #      "name"  = "wk",
      "name"   = var.project_name,
      "image"  = var.project_image,
      "cpu"    = var.project_cpu,
      "memory" = var.project_memory,
      "portMappings" = [
        {
          "protocol" : "tcp",
          "containerPort" : var.project_container_port
        }
      ],
      "essential" = true,
      "logConfiguration" = {
        "logDriver" = "awslogs",
        "options" = {
          "awslogs-group"         = var.project_name,
          "awslogs-region"        = var.aws_region,
          "awslogs-stream-prefix" = var.project_name
        }
      }
    }
  ])
}
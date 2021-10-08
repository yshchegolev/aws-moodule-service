resource "aws_ecs_task_definition" "project_ecs_task_definition" {
  family                = "${var.project_name}-task-family"
  network_mode          = "bridge"
  container_definitions = local.container_definitions
  tags                  = var.aws_tags
}
resource "aws_ecs_service" "project_ecs_service" {
  name                               = "${var.project_name}-service"
  cluster                            = var.ecs_cluster_id
  task_definition                    = aws_ecs_task_definition.project_ecs_task_definition.arn
  desired_count                      = var.scaling_settings.desired_count
  deployment_maximum_percent         = var.scaling_settings.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.scaling_settings.deployment_minimum_healthy_percent


  load_balancer {
    target_group_arn = aws_lb_target_group.project_alb_tg.arn
    container_name   = var.project_name
    container_port   = var.project_container_port
  }
}

resource "aws_lb_listener" "project_alb_listener" {
  load_balancer_arn = aws_lb.project_alb.arn
  port              = var.project_container_port
  protocol          = var.lb_protocol

  default_action {
    target_group_arn = aws_lb_target_group.project_alb_tg.arn
    type             = "forward"
  }
}

resource "aws_lb" "project_alb" {
  load_balancer_type = "application"

  name            = "${var.project_name}-alb"
  internal        = false
  security_groups = var.alb_security_groups
  subnets         = var.alb_subnets
  access_logs {
    bucket  = aws_s3_bucket.project_lb_logs.bucket
    enabled = true
  }

  tags = var.aws_tags
}

resource "aws_lb_target_group" "project_alb_tg" {
  name     = "${var.project_name}-alb-tg"
  port     = var.project_container_port
  protocol = var.lb_protocol
  vpc_id   = var.vpc_id

  deregistration_delay = 60

  health_check {
    path                = var.healthcheck_endpoint
    matcher             = var.healthcheck_settigns.matcher
    healthy_threshold   = var.healthcheck_settigns.unhealthy_threshold
    unhealthy_threshold = var.healthcheck_settigns.unhealthy_threshold
    timeout             = var.healthcheck_settigns.timeout
    interval            = var.healthcheck_settigns.interval
  }
  tags       = var.aws_tags
  depends_on = [aws_lb.project_alb]
}

variable "project_name" {
  description = "Name of project to be used in tags"
  type        = string
}

variable "aws_tags" {
  description = "AWS tags for subnet"
  type        = map(string)
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_image" {
  description = "Docker image for project"
  type        = string
}

variable "project_cpu" {
  description = "Project CPU limit"
  type        = number
  default     = 128
}

variable "project_memory" {
  description = "Project memory limit"
  type        = number
  default     = 16
}

variable "project_container_port" {
  description = "Port, exposed in application container"
  type        = number
}
variable "ecs_cluster_id" {
  description = "ID of ECS cluster"
  type        = string
}

variable "alb_security_groups" {
  description = "Security groups for alb"
  type        = list(string)
}

variable "alb_subnets" {
  description = "Subnet IDs for alb"
  type        = list(string)
}

variable "vpc_id" {
  description = "Project VPC id"
  type        = string
}

variable "scaling_settings" {
  description = "Scaling settings for service"
  type        = map(any)
  default = {
    desired_count                      = 10
    deployment_maximum_percent         = 150
    deployment_minimum_healthy_percent = 10

  }
}

variable "lb_protocol" {
  description = "Web protocol for LB"
  type        = string
}

variable "healthcheck_endpoint" {
  description = "Web endpoint for healthcheck"
  type        = string
}

variable "healthcheck_settigns" {
  description = "Tasks healthcheck settings"
  type        = map(any)
  default = {
    matcher             = "200"
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 15
    interval            = 30
  }
}
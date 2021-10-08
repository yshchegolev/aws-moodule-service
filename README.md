## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.0.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.61.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.61.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecs_service.project_ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.project_ecs_task_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_lb.project_alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.project_alb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.project_alb_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_s3_bucket.project_lb_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.project_lb_logs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_elb_service_account.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/elb_service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_security_groups"></a> [alb\_security\_groups](#input\_alb\_security\_groups) | Security groups for alb | `list(string)` | n/a | yes |
| <a name="input_alb_subnets"></a> [alb\_subnets](#input\_alb\_subnets) | Subnet IDs for alb | `list(string)` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | n/a | yes |
| <a name="input_aws_tags"></a> [aws\_tags](#input\_aws\_tags) | AWS tags for subnet | `map(string)` | n/a | yes |
| <a name="input_ecs_cluster_id"></a> [ecs\_cluster\_id](#input\_ecs\_cluster\_id) | ID of ECS cluster | `string` | n/a | yes |
| <a name="input_healthcheck_endpoint"></a> [healthcheck\_endpoint](#input\_healthcheck\_endpoint) | Web endpoint for healthcheck | `string` | n/a | yes |
| <a name="input_healthcheck_settigns"></a> [healthcheck\_settigns](#input\_healthcheck\_settigns) | Tasks healthcheck settings | `map(any)` | <pre>{<br>  "healthy_threshold": 2,<br>  "interval": 30,<br>  "matcher": "200",<br>  "timeout": 15,<br>  "unhealthy_threshold": 5<br>}</pre> | no |
| <a name="input_lb_protocol"></a> [lb\_protocol](#input\_lb\_protocol) | Web protocol for LB | `string` | n/a | yes |
| <a name="input_project_container_port"></a> [project\_container\_port](#input\_project\_container\_port) | Port, exposed in application container | `number` | n/a | yes |
| <a name="input_project_cpu"></a> [project\_cpu](#input\_project\_cpu) | Project CPU limit | `number` | `128` | no |
| <a name="input_project_image"></a> [project\_image](#input\_project\_image) | Docker image for project | `string` | n/a | yes |
| <a name="input_project_memory"></a> [project\_memory](#input\_project\_memory) | Project memory limit | `number` | `16` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of project to be used in tags | `string` | n/a | yes |
| <a name="input_scaling_settings"></a> [scaling\_settings](#input\_scaling\_settings) | Scaling settings for service | `map(any)` | <pre>{<br>  "deployment_maximum_percent": 150,<br>  "deployment_minimum_healthy_percent": 10,<br>  "desired_count": 10<br>}</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Project VPC id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_dns_name"></a> [service\_dns\_name](#output\_service\_dns\_name) | LB DNS name |

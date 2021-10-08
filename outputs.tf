output "service_dns_name" {
  description = "LB DNS name"
  value       = aws_lb.project_alb.dns_name
}

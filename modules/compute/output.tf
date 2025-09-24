output "lb_dns_name" {
  value       = aws_lb.ec2_lb.dns_name
  description = "DNS do Load Balancer"
}
output "lb_url" {
  value       = "http://${module.compute.lb_dns_name}"
  description = "URL pública do Load Balancer"
}
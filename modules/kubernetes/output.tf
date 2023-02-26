output "app_endpoint" {
  description = "The URL for accessing the deployed application"
  value = kubernetes_service.app_service.status[0].load_balancer.ingress[0].ip
}

output "kubernetes_cluster_name" {
  value = module.kubernetes.kubernetes_cluster_name
}

output "kubernetes_cluster_endpoint" {
  value = module.kubernetes.kubernetes_cluster_endpoint
}

output "jenkins_url" {
  value = "http://${aws_instance.jenkins.public_ip}:8080/"
}

output "django_app_url" {
  value = module.kubernetes.django_app_url
}

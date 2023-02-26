variable "kubernetes_cluster_context" {
  description = "The name of the Kubernetes cluster context to use for deployment"
}

variable "app_name" {
  description = "The name of the application to deploy"
}

variable "app_image" {
  description = "The Docker image to deploy for the application"
}

variable "app_port" {
  description = "The port on which the application listens"
}

variable "app_replicas" {
  description = "The number of replicas of the application to deploy"
  default = 1
}

variable "db_password" {
  description = "The password to use for the database connection"
}

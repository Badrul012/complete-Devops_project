variable "app_name" {
  description = "Name of the Django application"
  type        = string
  default     = "myapp"
}

variable "image_name" {
  description = "Name of the Docker image"
  type        = string
  default     = "myapp-image"
}

variable "image_tag" {
  description = "Tag of the Docker image"
  type        = string
  default     = "latest"
}

variable "minikube_ip" {
  description = "IP address of the Minikube instance"
  type        = string
  default     = "192.168.49.2"
}

variable "minikube_ssh_user" {
  description = "SSH username for the Minikube instance"
  type        = string
  default     = "ubuntu"
}

variable "minikube_ssh_private_key" {
  description = "SSH private key for the Minikube instance"
  type        = string
  default     = file("~/.ssh/id_rsa")
}

variable "jenkins_admin_username" {
  description = "Username for the Jenkins admin user"
  type        = string
  default     = "admin"
}

variable "jenkins_admin_password" {
  description = "Password for the Jenkins admin user"
  type        = string
  default     = "password"
}

variable "jenkins_ssh_user" {
  description = "SSH username for the Jenkins instance"
  type        = string
  default     = "ubuntu"
}

variable "jenkins_ssh_private_key" {
  description = "SSH private key for the Jenkins instance"
  type        = string
  default     = file("~/.ssh/id_rsa")
}

variable "aws_region" {
  description = "AWS region for the ECR repository"
  type        = string
  default     = "us-east-1"
}

variable "aws_account_id" {
  description = "AWS account ID for the ECR repository"
  type        = string
  default     = "123456789012"
}

terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.0.2"
    }
    jenkins = {
      source = "jenkinsci/jenkins"
      version = ">= 2.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "jenkins" {
  url               = "http://jenkins.example.com"
  username          = "admin"
  password          = "admin"
  insecure_skip_tls_verify = true
}

module "django" {
  source = "./django"

  kubernetes_cluster_name = "example-cluster"
  kubernetes_namespace    = "example-namespace"

  jenkins_job_name        = "example-job"
  jenkins_pipeline_script = "Jenkinsfile"
}

provider "kubernetes" {
  config_context_cluster = var.kubernetes_cluster_context
}

module "app" {
  source = "../app"

  app_name = var.app_name
  app_image = var.app_image
  app_port = var.app_port
}

resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = var.app_name
  }
}

resource "kubernetes_secret" "app_secret" {
  metadata {
    name = "app-secret"
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
  }
  data = {
    DB_PASSWORD = var.db_password
  }
}

resource "kubernetes_deployment" "app_deployment" {
  metadata {
    name = var.app_name
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
    labels = {
      app = var.app_name
    }
  }

  spec {
    replicas = var.app_replicas

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name = var.app_name
          image = var.app_image
          ports {
            container_port = var.app_port
          }
          env {
            name = "DB_PASSWORD"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.app_secret.metadata[0].name
                key = "DB_PASSWORD"
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app_service" {
  metadata {
    name = var.app_name
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
    labels = {
      app = var.app_name
    }
  }

  spec {
    selector = {
      app = var.app_name
    }

    port {
      port = var.app_port
      target_port = var.app_port
    }
  }
}

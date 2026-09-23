terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx-secret"
    namespace = "terraform-platform"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "nginx-secret"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx-secret"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:1.27"

          env_from {
            secret_ref {
              name = "database-secret"
            }
          }

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

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

resource "kubernetes_config_map" "nginx" {
  metadata {
    name      = "nginx-config"
    namespace = "terraform-platform"
  }

  data = {
    APP_ENV  = var.app_env
    APP_NAME = var.app_name
  }
}


resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx-config"
    namespace = "terraform-platform"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "nginx-config"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx-config"
        }

        annotations = {
          "config-checksum" = sha256(jsonencode(kubernetes_config_map.nginx.data))
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:1.27"

          env_from {
            config_map_ref {
              name = kubernetes_config_map.nginx.metadata[0].name
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

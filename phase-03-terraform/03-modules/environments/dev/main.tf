terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

module "nginx" {
  source = "../../nginx"

  image          = var.image
  container_name = var.container_name
  external_port  = var.external_port
  replicas       = var.replicas
}

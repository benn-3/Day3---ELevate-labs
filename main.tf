terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Pull the latest nginx image
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# Run a container from the nginx image
resource "docker_container" "nginx" {
  name  = "nginx_server"
  image = docker_image.nginx.name   # use .name, not .latest

  ports {
    internal = 80
    external = 8080
  }
}


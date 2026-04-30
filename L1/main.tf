terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.2.0"
    }
  }
}

provider "docker" {
  # Configuration options
}
resource "docker_image" "nginx_image" { # This `resource` block creates a Docker image named `nginx_image` using the `nginx:1.23.3` image.
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" { # This `resource` block creates a Docker container named `nginx_container` based on the `nginx_image` image.
  name  = "web-server"                          # This line specifies the name of the container.
  image = docker_image.nginx_image.image_id     # This line references the `nginx_image` resource created earlier to get the image ID.
  ports {                                       # This block specifies the ports to be exposed by the container.
    internal = 80                               # The container's internal port 80 will be exposed.
    external = 8080                             # The container's internal port 80 will be accessible on the host's port 8080.
  }
}
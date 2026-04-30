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

variable "image_name" {
  type        = string
  description = "The name of the Docker image"
  default     = "nginx"
}

variable "image_tag" {
  type        = string
  description = "The tag of the Docker image"
  default     = "latest"
}

variable "internal_port" {
  type        = number
  description = "The internal port number for the container"
}

variable "external_port" {
  type        = number
  description = "The external port number for the container"
}
resource "docker_image" "nginx_image" { # This `resource` block creates a Docker image named `nginx_image` using the `nginx:1.23.3` image.
  name = "${var.image_name}:${var.image_tag}"
}

resource "docker_container" "nginx_container" { # This `resource` block creates a Docker container named `nginx_container` based on the `nginx_image` image.
  name  = "web-server"                          # This line specifies the name of the container.
  image = docker_image.nginx_image.image_id     # This line references the `nginx_image` resource created earlier to get the image ID.
  ports {                                       # This block specifies the ports to be exposed by the container.
    internal = var.internal_port                # The container's internal port 80 will be exposed.
    external = var.external_port                # The container's internal port 80 will be accessible on the host's port 8080.
  }
}
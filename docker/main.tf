resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "random_string" "random" {
  count   = var.counter
  length  = 4
  special = false
  upper   = false
}

resource "docker_container" "nodered_container" {
  count = var.counter
  name  = join("-", ["nodered", random_string.random[count.index].result])
  image = docker_image.nodered_image.image_id
  ports {
    internal = var.int_port
    external = var.ext_port
  }
}



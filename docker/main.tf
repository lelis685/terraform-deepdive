resource "docker_image" "nodered_image" {
  name = lookup(var.image, var.env)
}

resource "random_string" "random" {
  count   = local.counter
  length  = 4
  special = false
  upper   = false
}

resource "docker_container" "nodered_container" {
  count = local.counter
  name  = join("-", ["nodered", random_string.random[count.index].result])
  image = docker_image.nodered_image.image_id
  ports {
    internal = var.int_port
    external = var.ext_port[count.index]
  }
}



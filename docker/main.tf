module "image" {
  source = "./image"
  image_in = var.image[var.env]
  
}

resource "random_string" "random" {
  count   = local.counter
  length  = 4
  special = false
  upper   = false
}

resource "docker_container" "nodered_container" {
  depends_on = [module.image]
  count = local.counter
  name  = join("-", ["nodered", random_string.random[count.index].result])
  image = module.image.image_out.image_id
  ports {
    internal = var.int_port
    external = var.ext_port[var.env][count.index]
  }

}




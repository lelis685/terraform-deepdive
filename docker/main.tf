module "image" {
  source   = "./image"
  image_in = var.image[var.env]

}

resource "random_string" "random" {
  count   = local.counter
  length  = 4
  special = false
  upper   = false
}

module "container" {
  source      = "./container"
  count       = local.counter
  name_in     = join("-", ["nodered", random_string.random[count.index].result])
  image_in    = module.image.image_out.image_id
  int_port_in = var.int_port
  ext_port_in = var.ext_port[var.env][count.index]
}




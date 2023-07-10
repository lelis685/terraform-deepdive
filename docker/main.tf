locals {
  deployment = {
    nodered = {
      container_counter = length(var.ext_port["nodered"][var.env])
      image             = var.image["nodered"][var.env]
      int               = 1880
      ext               = var.ext_port["nodered"][var.env]
      container_path    = "/data"
    }
    influxdb = {
      container_counter = length(var.ext_port["influxdb"][var.env])
      image             = var.image["influxdb"][var.env]
      int               = 8086
      ext               = var.ext_port["influxdb"][var.env]
      container_path    = "/var/lib/influxdb"
    }
  }
}

module "image" {
  source   = "./image"
  for_each = local.deployment
  image_in = each.value.image
}


module "container" {
  source            = "./container"
  for_each          = local.deployment
  count_in          = each.value.container_counter
  name_in           = each.key
  image_in          = module.image[each.key].image_out.image_id
  int_port_in       = each.value.int
  ext_port_in       = each.value.ext
  container_path_in = each.value.container_path
  env               = var.env
}



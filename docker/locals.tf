locals {
  deployment = {
    nodered = {
      container_counter = length(var.ext_port["nodered"][var.env])
      image             = var.image["nodered"][var.env]
      int               = 1880
      ext               = var.ext_port["nodered"][var.env]
      volumes = [
        { container_path_each = "/data" }
      ]
    }
    influxdb = {
      container_counter = length(var.ext_port["influxdb"][var.env])
      image             = var.image["influxdb"][var.env]
      int               = 8086
      ext               = var.ext_port["influxdb"][var.env]
      volumes = [
        { container_path_each = "/var/lib/influxdb" }
      ]
    }
    grafana = {
      container_counter = length(var.ext_port["grafana"][var.env])
      image             = var.image["grafana"][var.env]
      int               = 3000
      ext               = var.ext_port["grafana"][var.env]
      volumes = [
        { container_path_each = "/var/lib/grafana" },
        { container_path_each = "/etc/grafana/provisioning" }
      ]
    }
  }
}
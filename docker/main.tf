resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

variable "counter" {
  type = number
  default = 1
}

variable "ext_port" {
  type = number
  default = 1880
}

variable "int_port" {
  type = number
  default = 1881
  validation {
    condition = var.int_port == 1880
    error_message = "Internal port must be 1880."
  }
}



resource "random_string" "random" {
  count = var.counter
  length = 4
  special = false
  upper = false
}


resource "docker_container" "nodered_container" {
  count = var.counter
  name  = join("-",["nodered", random_string.random[count.index].result])  
  image = docker_image.nodered_image.image_id
  ports {
    internal = var.int_port
    external = var.ext_port
  }
}


output "IP-address" {
  value = flatten([for i in docker_container.nodered_container[*]: flatten(formatlist("%s:%s", join("", i.network_data[*].ip_address), i.ports[*].external)) ])
  description = "ip container"
} 


output "container-name" {
  value = docker_container.nodered_container[*].name
  description = "name of container"
} 

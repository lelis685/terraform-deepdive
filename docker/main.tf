resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "random_string" "random" {
  count = 2
  length = 4
  special = false
  upper = false
}


resource "random_integer" "random_int" {
  count = 2
  min = 1
  max = 100
}


resource "docker_container" "nodered_container" {
  count = 2
  name  = join("-",["nodered", random_string.random[count.index].result])  
  image = docker_image.nodered_image.image_id
  ports {
    internal = random_integer.random_int[count.index].result
    external = random_integer.random_int[count.index].result
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

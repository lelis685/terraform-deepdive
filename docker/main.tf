resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "docker_container" "nodered_container" {
  name  = "nodered"
  image = docker_image.nodered_image.image_id
  ports {
    internal = 1880
    external = 1880
  }

}

output "IP-address" {
  value = docker_container.nodered_container.network_data[0].ip_address
  description = "ip address of container"
} 

output "ports" {
  value = join(":", [docker_container.nodered_container.network_data[0].ip_address, docker_container.nodered_container.ports[0].external])
  description = "ports of container"
} 

output "container-name" {
  value = docker_container.nodered_container.name
  description = "name of container"
} 

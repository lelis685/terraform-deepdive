output "IP-address" {
  value       = flatten([for i in docker_container.nodered_container[*] : flatten(formatlist("%s:%s", join("", i.network_data[*].ip_address), i.ports[*].external))])
  description = "ip container"
  sensitive = true
}


output "container-name" {
  value       = docker_container.nodered_container[*].name
  description = "name of container"
}

output "IP-address" {
  value       = flatten(module.container[*].IP-address)
  description = "ip container"
}

output "container-name" {
  value       = flatten(module.container[*].container-name)
  description = "name of container"
}


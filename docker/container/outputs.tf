output "application_access" {
  value = {for x in docker_container.container[*]: x.name => flatten(formatlist("%s:%s", join("", x.network_data[*].ip_address), x.ports[*].external)) }
}
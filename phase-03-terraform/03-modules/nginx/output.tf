output "container_names" {
  value = docker_container.nginx[*].name
}

output "container_ids" {
  value = docker_container.nginx[*].id
}

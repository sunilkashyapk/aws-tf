output "Container IP Address"{
    value = "${docker_container.container_id.ip_address}"
}

output "Container Name" {
    value = "${docker_container.container_id.name}"
}
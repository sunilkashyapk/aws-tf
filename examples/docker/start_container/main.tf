# download the docker image and start a container
resource "docker_image" "image_id" {
    name = "${var.image_name}"
}

resource "docker_container" "container_id" {
    name = "${var.container_name}"
    image = "${docker_image.image_id.latest}"
}
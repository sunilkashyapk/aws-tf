# only downloads an image from docker registry
resource "docker_image" "image_id" {
    name = "nginx:latest"
}
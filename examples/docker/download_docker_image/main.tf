# only downloads an image from docker registry
resource "docker_image" "image_id" {
    name = "hello-world:latest"
}
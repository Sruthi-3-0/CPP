provider "docker" {}

resource "docker_image" "app_image" {
  name = "jenkins-devsecops-app"

  build {
    context = ".."
  }
}

resource "docker_container" "app_container" {
  name  = "jenkins-devsecops-container"
  image = docker_image.app_image.image_id

  ports {
    internal = 8083
    external = 8083
  }
}

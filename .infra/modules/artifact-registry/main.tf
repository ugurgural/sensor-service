resource "google_artifact_registry_repository" "container-images-repo" {
    location = var.region
    project = var.project
    repository_id = "aviatar-euw3-ar-images"
    format = "DOCKER"
}
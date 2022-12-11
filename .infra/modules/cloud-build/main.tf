resource "google_cloudbuild_trigger" "aviatar-euw3-sensor-service-01-cloudbuild-trigger" {
  project = var.project
  github {
    owner = "https://github.com/ugurgural/"
    name  = "sensor-service"

    push {
      branch = "^main$"

    }
  }
  ignored_files = [".gitignore"]

  filename = "cloudbuild.yaml"

}

resource "google_cloudbuild_trigger" "aviatar-euw4-sensor-service-02-cloudbuild-trigger" {
  project = var.project
  github {
    owner = "https://github.com/ugurgural/"
    name  = "sensor-service"

    push {
      branch = "^main$"

    }
  }
  ignored_files = [".gitignore"]

  filename = "cloudbuild.yaml"

}

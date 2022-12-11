resource "google_cloud_run_service" "aviatar-euw3-sensor-service-01" {
  name     = "aviatar-euw3-sensor-service-01"
  location = var.region
  project = var.project

  template {
    spec {
      service_account_name = var.service_account_mail
      containers {
        image = "europe-west3-docker.pkg.dev/stately-diagram-370913/aviatar-euw3-ar-images/sensor-service:latest"

        env {
          name  = "TOPIC_PATH"
          value = "projects/stately-diagram-370913/topics/sensor-data"
        }
        env {
          name  = "SENSOR_ID"
          value = "sensor-1"
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service" "aviatar-euw3-sensor-service-02" {
  name     = "aviatar-euw3-sensor-service-02"
  location = var.region
  project = var.project

  template {
    spec {
      service_account_name = var.service_account_mail
      containers {
        image = "europe-west3-docker.pkg.dev/stately-diagram-370913/aviatar-euw3-ar-images/sensor-service:latest"

        env {
          name  = "TOPIC_PATH"
          value = "projects/stately-diagram-370913/topics/sensor-data"
        }
        env {
          name  = "SENSOR_ID"
          value = "sensor-2"
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_scheduler_job" "aviatar-euw3-sensor-scheduler-01" {
  name             = "aviatar-euw3-sensor-scheduler-01-test"
  project          = var.project
  region           = var.region
  description      = ""
  schedule         = "*/5 * * * *"
  time_zone        = "Europe/Berlin"
  attempt_deadline = "320s"

  retry_config {
    retry_count = 1
  }

  http_target {
    http_method = "GET"
    uri         = format("%s/send_report", var.sensor_service_01_url)
  }
}

resource "google_cloud_scheduler_job" "aviatar-euw3-sensor-scheduler-02" {
  name             = "aviatar-euw3-sensor-scheduler-02-test"
  project          = var.project
  region           = var.region
  description      = ""
  schedule         = "*/5 * * * *"
  time_zone        = "Europe/Berlin"
  attempt_deadline = "320s"

  retry_config {
    retry_count = 1
  }

  http_target {
    http_method = "GET"
    uri         = format("%s/send_report", var.sensor_service_02_url)
  }
}

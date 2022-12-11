resource "google_pubsub_topic" "sensor_data" {
  name    = "sensor-data"
  project = var.project
}

resource "google_pubsub_subscription" "sensor_data_sub" {
  ack_deadline_seconds = 10
  expiration_policy {
    ttl = "2678400s"
  }
  message_retention_duration = "604800s"
  name                       = "sensor-data-sub"
  project                    = var.project
  topic                      = "projects/stately-diagram-370913/topics/sensor-data"
}
resource "google_pubsub_topic" "sensor_data" {
  name    = "sensor-data"
  project = var.project
}

resource "google_storage_bucket" "project-buckets" {
  name          = "ugurtest"
  location      = var.region
  force_destroy = true
}
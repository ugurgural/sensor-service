output "service_01_url" {
  value = google_cloud_run_service.aviatar-euw3-sensor-service-01.status[0].url
}

output "service_02_url" {
  value = google_cloud_run_service.aviatar-euw3-sensor-service-02.status[0].url
}
locals {
  environment = lower(terraform.workspace) == "default" ? "test" : lower(terraform.workspace)
}

module "artifact_registry" {
  source = "./modules/artifact-registry"
  region = var.region
  project = var.project
}

module "cloud_build" {
  source = "./modules/cloud-build"
  project = var.project
}

module "cloud_run" {
  source = "./modules/cloud-run"
  region = var.region
  service_account_mail = var.service_account_mail
  project = var.project
}

module "cloud_scheduler" {
  source = "./modules/cloud-scheduler"
  project = var.project
  region = var.region
  sensor_service_01_url = module.cloud_run.service_01_url
  sensor_service_02_url = module.cloud_run.service_02_url
}

module "pubsub" {
  source = "./modules/pub-sub"
  region = var.region
  project = var.project
}
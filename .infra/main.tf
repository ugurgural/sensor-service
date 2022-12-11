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

module "pubsub" {
  source = "./modules/pub-sub"
  region = var.region
  project = var.project
}
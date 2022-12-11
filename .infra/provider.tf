terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.45.0"
    }
  }

  backend "local" {
    path = ".infra/terraform.tfstate"
  }
}

provider "google" {
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}
data "google_service_account_access_token" "default" {
  target_service_account = var.service_account_mail
  scopes = [
    "userinfo-email",
    "cloud-platform",
  ]
  lifetime = "300s"
}

provider "google" {
  project = var.project
  alias        = "service_account"
  access_token = data.google_service_account_access_token.default.access_token
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}
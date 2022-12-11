locals {
  environment = lower(terraform.workspace) == "default" ? "test" : lower(terraform.workspace)
  region = "europe-west3"
}

module "pubsub" {
  source = "./modules/pub-sub"
  region = var.region
}

# Sensor Service

## Setting up GCP prerequisites

In order to run terraform project, a service account impersonating a cloud user is required. For accomplish this :

 Create a service account Google Cloud CLI: 

    gcloud iam service-accounts create tf-serviceaccount --display-name="Terraform Service Account"

Supply the service account with enough permissions:

    gcloud projects add-iam-policy-binding {projectid} tf-serviceaccount@{projectid}.iam.gserviceaccount.com –-role="roles/editor"

In order to easily run local development with service account, add policy binding with a real cloud user:

    gcloud iam service-accounts add-iam-policy-binding tf-serviceaccount@{projectid}.iam.gserviceaccount.com --member user:{usermail} --role roles/iam.serviceAccountTokenCreator

## Running Terraform project

The files related terraform project is under `.infra` folder. There are two workspaces pre-set for example purposes, which are `test` and `prod`. 

Run the plan command with proper environment variable file supplied:

    terraform plan -var-file=./environments/{environment}.tfvars

Then run the apply command with same variable file:

    terraform apply -var-file=./environments/test.tfvars

# Infrastructure Diagram

The resources of this terraform project will create can be seen in the diagram below.

![Infra diagram](https://raw.githubusercontent.com/ugurgural/sensor-service/main/.infra/infra-diagram.png?token=GHSAT0AAAAAAB4D2FYNIAWUMBUHZFYPPZA6Y4WK24A)

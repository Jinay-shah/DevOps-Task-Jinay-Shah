# This specify the provider of terraform (used to configure settings related to Terraform itself)
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.38.0"
    }
  }
}

# This mention that we are using google cloud provider
provider "google" {
  project     = var.project_id
  region      = var.region  
}

# Defining my Cloud Run service resource

resource "google_cloud_run_service" "my_service" {
  name     = var.service_name
  location = var.region  

#  configuration for the Cloud Run service

  template {
    spec {
      containers {
        image = var.image_url
        ports {
          container_port = 5000
        }
      }
    }
  }

}

#  policy for the Cloud Run service to allow public access as mentioned in the requirements

resource "google_cloud_run_service_iam_member" "invoker" {
  service = google_cloud_run_service.my_service.name
  location     = google_cloud_run_service.my_service.location
  role         = "roles/run.invoker"
  member       = "allUsers"
}

output "url" {
  value = google_cloud_run_service.my_service.status[0].url
}
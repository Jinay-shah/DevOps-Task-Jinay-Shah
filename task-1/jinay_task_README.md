# Cloud Run Deployment with Terraform
# Deploying a Node.js "Hello World" App to Google Cloud Run using Terraform

## Overview

This contains Terraform configuration files to deploy a simple "Hello World" application to Google Cloud Run. The setup includes creating a Cloud Run service, configuring IAM permissions for public access, and specifying the Docker image to be used.

## Configuration Files

1. **`main.tf`**: Contains the main Terraform configuration for creating the Cloud Run service and setting IAM permissions.
2. **`variables.tf`**: Defines the variables used in the Terraform configuration.
3. **`terraform.tfvars`**: Provides values for the variables defined in `variables.tf`.

# Steps taken to achieve the task 
1. Firstly I created the application using Node.js and create docker file. 
2. I build the image and run the image checked it in local using Docker Desktop and then moved to GCP.
3. In GCP account I created new project named "jinay-aviato-task".
4. Under APIs & Services I enabled the required APIs.
5. I created the repository in Artifact Registry.
6. Then I used the GCP Console to uplod my application and docker file. For which I need to authenticate with google cloud.
7. I build my docker Docker image using build command push it to the created repository in artifcat registry.
8. Then I created my terraform scripts as I mentioned above. 
9. By applying terraform in gcp console only my service created and running under Cloud Run. 


## Link to access

[https://hello-world-service-zwrr7lemvq-ue.a.run.app]( https://hello-world-service-zwrr7lemvq-ue.a.run.app )


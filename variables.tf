variable "billing_account" {
  type = string
  description = "Required for project setup and some other operations"
}

variable "project_id" {
  type = string
  description = "The ID of the project that is created via terraform"
}

variable "project_name" {
  type = string
  description = "Project Name"
  default = "Demo Project - Terraform + GCP + GKE + .."
}

variable "vpc_name" {
  type = string
  description = "Identifier of the VPC network"
  default = "default-vpc"
}

variable "google_apis" {
  description = "Set of extra Google APIs that need to be enabled"
  default = [ 
    "container.googleapis.com"
    "cloudbuild.googleapis.com"
    "run.googleapis.com"
    "alloydb.googleapis.com"
    "containerregistry.googleapis.com"
    "compute.googleapis.com"
    "dns.googleapis.com"
    "iam.googleapis.com"
]}

variable "region" {
  description = "The region in which to create the GKE cluster"
  default = "australia-southeast1"
}

variable "subnet_name" {
  description = "The name of the subnet"
  type = string
  default = "gke-vpc-subnet"
}



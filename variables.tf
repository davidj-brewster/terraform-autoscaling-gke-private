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
  default = "GCP Terraform Setup Project"
}

variable "vpc_name" {
  type = string
  description = "Identifier of the VPC network"
  default = "default-vpc"
}

variable "google_apis" {
  description = "Set of extra Google APIs that need to be enabled"
  default = [ 
    "container.googleapis.com",
    "cloudbuild.googleapis.com",
    "run.googleapis.com",
    "alloydb.googleapis.com",
    "containerregistry.googleapis.com",
    "compute.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com"
  ]
}

variable "region" {
  description = "The region in which to create the GKE cluster"
  default = "australia-southeast1"
}

variable "vpc_subnet" {
  type = string
  description = "Subnet name we'll use for GKE"
  default = "default-vpc-subnet-gke-au"
}

variable "gke_serviceaccount" {
  type = string
  description = "Terraform managaed serviceaccount for the compute scope"
  default = "svcacct-gke-compute-tfpoc-au"
}


variable "billing_account" {
  type        = string
  description = "Required for project setup and some other operations"
}

variable "project_id" {
  type        = string
  description = "The ID of the project that is created via terraform"
}

variable "vpc_name" {
  type        = string
  description = "Identifier of the VPC network"
  default     = "default-vpc"
}

variable "vpc_subnet" {
  type        = string
  description = "Subnet name we'll use for GKE"
}

variable "region" {
  description = "The region in which to create the GKE cluster"
}

variable "gke_serviceaccount" {
  description = "Compute service account for GKE"
  type        = string
  default     = "gke-svcacct-poccluster"
}


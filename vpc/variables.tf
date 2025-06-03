variable "project_id" {
  type        = string
  description = "The ID of the project that is created via terraform"
}

variable "vpc_name" {
  type        = string
  description = "Identifier of the VPC network"
}

# variable "vpc_subnet" {
#   description = "The name of the subnet"
#   type        = string
# }

variable "allowed_ssh_ips" {
  description = "IPs allowed to access a bastian host to reach the control plane"
  type        = string
}

variable "public_subnet_range" {
  type        = string
  description = "The IPs to assign to the public subnet, which will host the jump host"
}

variable "region" {
  type        = string
  description = "The region to create public subnet, also where compute instances will get spun up"
}

variable "public_subnet_name" {
  type        = string
}

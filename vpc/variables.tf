variable "project_id" {
  type = string
  description = "The ID of the project that is created via terraform"
}

variable "vpc_name" {
  type = string
  description = "Identifier of the VPC network"
}

variable "subnet_name" {
  description = "The name of the subnet"
  type = string
}


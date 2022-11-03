variable "provider_region" {
  type = string
}

variable "provider_profile" {
  type = string
}

variable "environment" {
  type = string
}

variable "organization" {
  type = string
}

variable "domain" {
  type = string
}

variable "subnets_public_vpc" {
  type        = list(string)
  description = "The list of public subnets for the VPC"
}

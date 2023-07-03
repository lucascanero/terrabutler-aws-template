terraform {
  required_version = ">= 1"

  # comment the following when initially preparing the very first envs
  #backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.6.2"
    }
  }
}

provider "aws" {
    region = var.region
    profile = "709"
}

terraform {
  required_version = "1.4.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.65"
    }
  }
}
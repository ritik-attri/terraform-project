terraform {

  cloud {
    organization = "your organization"

    workspaces {
      name = "your workspace name"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.2"
    }
  }

  required_version = ">= 0.14.0"
}

provider "aws" {
    region = "ap-south-1"
    access_key = "your access key"
    secret_key = "your secret access key"
}
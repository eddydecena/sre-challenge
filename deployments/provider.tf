terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }
  }

  cloud {
    organization = "unbar"

    workspaces {
      name = "sre"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
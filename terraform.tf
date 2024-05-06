terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "startercc-terraform-state"
    key            = "samples/static-server/us-east-1/terraform.tfstate"
    dynamodb_table = "dynamoDB-startercc-terraform-state-locking"
    region         = "us-east-1"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
backend "s3" {
    bucket = "linga-devops-rs"
    key    = "amazon-linux-key"
    region = "us-east-1"
    dynamodb_table = "linga-devops-locking"
    #use_lockfile = true
    }
  }
provider "aws" {
  region = "us-east-1"
}
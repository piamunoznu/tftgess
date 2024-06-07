terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "5.50.0"
      }
    }
#    backend "s3" {
#      bucket = "terra-bucket-state-pia983"
#      key = "terraform.tfstate"
#      region = "us-east-1"
#     dynamodb_table = "terraform_locks"
#      encrypt = true
#    }
}

provider "aws" {
    region = "us-east-1"

    assume_role {
      role_arn = "arn:aws:iam::308469693871:role/TerraTGRole"
      session_name = "terra-session"
      external_id = "93734a9282-e21d-2c35-b293-029283840197"
    }
  
}
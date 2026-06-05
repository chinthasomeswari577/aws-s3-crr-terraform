terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Mumbai Region (Source Bucket)
provider "aws" {
  region = "ap-south-1"
}

# Singapore Region (Destination Bucket)
provider "aws" {
  alias  = "singapore"
  region = "ap-southeast-1"
}

#In the main.tf file used for provider configuration.
#we have defined two AWS providers. 
#The first provider is configured for the Mumbai region (ap-south-1) and is used for the source S3 bucket.
#The second provider is aliased as "singapore" and is configured for the Singapore region (ap-southeast-1) to manage the destination S3 bucket. This setup allows us to manage resources in both regions within the same Terraform configuration.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

//I used here the connect via local credential 

//The provider
provider "aws" {
  // region
  region = "us-west-2"

  // profile name here!
  profile = "default"

}

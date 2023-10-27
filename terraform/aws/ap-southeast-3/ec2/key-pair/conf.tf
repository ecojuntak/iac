terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.22.0"
    }
  }
}

provider "aws" {
  region  = "ap-southeast-3"
  profile = "personal"
  default_tags {
    tags = {
      env                = "staging"
      terraform_manifest = element(split("capppyhoding/", path.cwd), 1)
    }
  }
}

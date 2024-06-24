terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.51.0"
    }
  }
}

provider "aws" {
  region  = "ap-southeast-3"
  profile = "personal"
  default_tags {
    tags = {
      env                = "staging"
      terraform_manifest = element(split("cappyhoding/", path.cwd), 1)
    }
  }
}

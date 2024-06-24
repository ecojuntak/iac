module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "staging"
  cidr = "10.0.0.0/16"

  azs              = ["ap-southeast-3a", "ap-southeast-3b", "ap-southeast-3c"]
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets   = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  database_subnets = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]

  enable_nat_gateway      = false
  map_public_ip_on_launch = false
}

data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../vpc/staging/terraform.tfstate"
  }
}

module "security_group" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "5.1.0"
  name        = "ssh"
  description = "Security group for SSH access"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Internet access"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

provider "aws" {
  region = var.region
}

module "kubernetes" {
  source = "terraform-aws-modules/kubernetes/aws"

  cluster_name = var.cluster_name
  subnets      = var.subnets
  vpc_id       = var.vpc_id
}

resource "aws_security_group" "k8s" {
  name_prefix = "k8s-"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "k8s-security-group"
  }
}


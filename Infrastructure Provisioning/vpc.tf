module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"

  # VPC Basic Details
  name            = "vpc-project"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true
  create_igw         = true

  public_subnet_tags = {
    Name                           = "public-us-east-1a"
    "kubernetes.io/cluster/my-eks" = "shared"
    "kubernetes.io/role/elb"       = 1

    Name                           = "public-us-east-1b"
    "kubernetes.io/cluster/my-eks" = "shared"
    "kubernetes.io/role/elb"       = 1
  }

  private_subnet_tags = {
    Name                             = "private-us-east-1a"
    "kubernetes.io/cluster/my-eks"   = "shared"
    "kubernetes.io/role/internalelb" = 1

    Name                             = "private-us-east-1b"
    "kubernetes.io/cluster/my-eks"   = "shared"
    "kubernetes.io/role/internalelb" = 1
  }


  tags = {
    Owner       = "bose"
    Environment = "project"
  }

  vpc_tags = {
    Name = "vpc-project"
  }
}

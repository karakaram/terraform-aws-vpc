region = "us-east-1"

name = "my-vpc"

cidr = "10.1.0.0/22"

azs = ["us-east-1a", "us-east-1c"]

private_subnets = ["10.1.2.0/24", "10.1.3.0/24"]

public_subnets = ["10.1.0.0/24", "10.1.1.0/24"]

enable_nat_gateway = true

single_nat_gateway = true

tags = {
  Environment = "development"
}

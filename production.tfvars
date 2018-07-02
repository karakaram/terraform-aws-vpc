region = "ap-northeast-1"

name = "my-vpc"

cidr = "10.0.0.0/22"

azs = ["ap-northeast-1a", "ap-northeast-1c"]

private_subnets = ["10.0.2.0/24", "10.0.3.0/24"]

public_subnets = ["10.0.0.0/24", "10.0.1.0/24"]

enable_nat_gateway = true

single_nat_gateway = true

tags = {
  Environment = "production"
}

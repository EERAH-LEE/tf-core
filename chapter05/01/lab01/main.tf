module "vpc" {
  source = "./modules/vpc"

  namespace  = local.namespace
  name       = "main"
  cidr_block = "10.0.0.0/16"
}


module "subnet" {
  source = "./modules/subnet"

  vpc_id     = module.vpc.id
  cidr_block = "10.0.1.0/24"

  availability_zone = "ap-northeast-2a"
  name              = "snet-pub-1"
  namespace         = local.namespace
  map_public_ip_on_launch = true
}
module "network" {
  source = "./modules/network"
  namespace = local.namespace
}

module "platform" {
  source = "./modules/platform"
  namespace = local.namespace

  vpc_id = module.network.vpc.id       #모듈.네트워크.vpc.id 받아옴...(저기 outputs 가서 보면 있는지 확인.)
  lb_subnets = [
    module.network.subnet["public-a"].id, 
    module.network.subnet["public-b"].id
    ]
}

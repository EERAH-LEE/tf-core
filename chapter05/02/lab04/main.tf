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

module "workload" {
  source = "./modules/workload"
  namespace = local.namespace

  vpc_id = module.network.vpc.id
  instance_subnet_id = module.network.subnet["private-a"].id
  instance_iam_instance_profile = module.platform.iamprofile.name
  instance_allow_access_cidr_blocks = [module.network.subnet["public-a"].cidr_blocks, module.network.subnet["public-b"].cidr_blocks]
  lb_target_group_arn = module.platform.lb.target_group.arn
  


}
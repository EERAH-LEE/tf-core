module "network" {
  source = "./modules/network"
  namespace = local.namespace
}

module "iam" {
  source = "./modules/iam"
  namespace = local.namespace
}
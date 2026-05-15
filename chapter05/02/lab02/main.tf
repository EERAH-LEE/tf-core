module "network" {
  source = "./modules/network"
  namespace = local.namespace
}

#module "platform" {
#  source = ""

#  subnet = [
#    module.network.subnet["public-a"].id, 
#    module.network.subnet["public-b"].id
#    ]
#}
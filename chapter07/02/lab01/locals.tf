locals {
  org = "tf-core"
  project = "lab01"
  enviroment = terraform.workspace

  namespace = "${local.org}-${local.project}-${local.enviroment}"
}
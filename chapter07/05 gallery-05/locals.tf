locals {
  org       = "tf-core"
  project   = "gallery"
  enviroment = var.env

  namespace = "${local.org}-${local.project}-${local.enviroment}"
  infra = {
    lt = {
      service_port = var.infra_lt_service_port
      instance_type = var.infra_lt_instance_type
    }
    
    lb = {
      listener_port = var.infra_lb_listener_port
    }

    asg = {
      deploy_version = var.infra_asg_deploy_version
      max_size = var.infra_asg_max_size
      min_size = var.infra_asg_min_size
      desired_capacity = var.infra_asg_desired_capacity
    }
  }
}
  
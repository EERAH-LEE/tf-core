locals {
  org = "tf-core"
  project = "lab01"
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

    db = {
      username = var.infra_db_username
      password = var.infra_db_password
    }

    asg = {
      min_size = var.infra_asg_min_size
      max_size = var.infra_asg_max_size
      desired_capacity = var.infra_asg_desired_capacity
      deploy_version = var.infra_asg_deploy_version
    }
  }
}
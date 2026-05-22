locals {
  org       = "tf-core"
  project   = "gallery"
  namespace = "${local.org}-${local.project}"
  infra = {
    lt = {
      service_port = 8080
    }
    
    lb = {
      listener_port = 80
    }

    asg = {
      deploy_version = "1.0.0"
    }
  }
}
  
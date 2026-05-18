locals {
  org       = "tf-core"
  project   = "gallery"
  namespace = "${local.org}-${local.project}"
  infra = {
    lt = {
      service_port = 8080
    }
  }
}
  
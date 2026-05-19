locals {
  org = "tf-core"
  project = "lab02"
  enviroment = terraform.workspace

  namespace = "${local.org}-${local.project}-${local.enviroment}"

  iamrole = {
    name = "instance"

    assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [{
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }]
    })

    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  instance = {
    name                        = "webweb"
    ami                         = "ami-0c003e98ceffee43e"
    instance_type               = terraform.workspace == "dev" ? "t3.small" : "t3.micro"
    associate_public_ip_address = true

    allow_access = {
      port        = 80
      cidr_blocks = terraform.workspace == "dev" ? ["10.0.0.0/16"] : ["0.0.0.0/16"]
    }
  } 
}
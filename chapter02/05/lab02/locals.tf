locals {
  project = "tf-core-lab01"

  vpc_id = "data.aws_vpc.default"

  instance = {
    name                        = "webweb"
    ami                         = data.aws_ami.amazon_linux
    instance_type               = var.instance_type
    associate_public_ip_address = true
    subnet_id = data.aws_subnets.default.ids[0]          #data에서 받아서 쓸 부분.

    allow_access = {
      port        = var.service_port   # 이 부분
      cidr_blocks = var.cidr_blocks
    }
  } 

  iamrole = {
    name = "instance"

    assume_role_policy = data.aws_iam_policy_document.ec2_assume_role
    policy_arn = data.aws_iam_policy.aws_ssm_core
  } 

}
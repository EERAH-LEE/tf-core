locals {
  project = "tf-core-lab01"


  instance = {
    name                        = "webweb"
    ami                         = "ami-0c003e98ceffee43e"
    instance_type               = var.instance_type
    associate_public_ip_address = true

    allow_access = {
      port        = var.service_port   # 이 부분
      cidr_blocks = var.cidr_blocks
    }
  } 

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

}
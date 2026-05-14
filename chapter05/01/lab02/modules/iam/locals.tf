locals {
  namespace = var.namespace

  iamrole = {
    name = "instance"

    assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
    policy_arn = data.aws_iam_policy.aws_ssm_core.arn
  } 
}
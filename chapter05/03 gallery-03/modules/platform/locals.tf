locals {
  namespace = var.namespace

  vpc_id = var.vpc_id

  iamrole = {
    name = "instance"

    assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
    policy_arn         = data.aws_iam_policy.aws_ssm_core.arn
  }

  lb = {
    name               = "main"
    internal           = false
    load_balancer_type = "application"
    subnets            = var.lb_subnets

    listener = {
      port        = var.lb_listener_port
      protocol    = "HTTP"
      cidr_blocks = ["0.0.0.0/0"]
    }

    target_group = { #workload쪽과 platform쪽 포트를 일치시킨다.
      port        = var.lb_target_group_port
      protocol    = "HTTP"
      target_type = "instance"

      health_check = {
        enabled             = true
        port                = var.lb_target_group_port
        protocol            = "HTTP"
        path                = "/actuator/health"  #참조.
        healthy_threshold   = 3   #3번 성공
        unhealthy_threshold = 3   #3번 실패
        timeout             = 5
        interval            = 30
      }
    }
  }




}

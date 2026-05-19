resource "aws_autoscaling_group" "this" {
   name = "${local.namespace}-asg-${local.asg.name}"

   min_size         = local.asg.min_size
   max_size         = local.asg.max_size
   desired_capacity = local.asg.desired_capacity

   vpc_zone_identifier = local.asg.vpc_zone_identifier

   target_group_arns = local.asg.target_group_arns
   health_check_type         = local.asg.health_check_type
   health_check_grace_period = local.asg.health_check_grace_period

   launch_template {
     id      = aws_launch_template.web.id
     version = "$Latest"
   }

  instance_refresh {
    strategy = "Rolling"  #옛것을 죽이고, 새 버전 업
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["tag"]    #태그가 바뀌면, 인스턴스를 새로 만든다.
  }

  tag {
    key                 = "DeployVersion"
    value               = "${local.namespace}-asg-${local.asg.deploy_version}"
    propagate_at_launch = true
  } 


}

resource "aws_launch_template" "web" {
   name = "${local.namespace}-gallery-${local.lt.name}"

   image_id               = local.lt.image_id
   instance_type          = local.lt.instance_type
   vpc_security_group_ids = [aws_security_group.this.id]
   update_default_version = true

   iam_instance_profile {
     name = local.lt.iam_instance_profile.name
   }

   user_data = local.lt.user_data

   tag_specifications {
     resource_type = "instance"
     tags = { Name = "${local.namespace}-instance-${local.lt.name}" }
   }
   
   tags = {
    Name = "${local.namespace}-instance-${local.lt.name}"
  }

}



resource "aws_security_group" "this" {
  name = "${local.namespace}-sg-${local.lt.name}"
  vpc_id = local.vpc_id

  ingress {
    from_port   = local.lt.allow_access.port
    to_port     = local.lt.allow_access.port
    protocol    = "tcp"
    cidr_blocks = local.lt.allow_access.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "${local.namespace}-sg-${local.lt.name}"
  }
}


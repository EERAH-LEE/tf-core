resource "aws_security_group" "this" {
  name = "${local.namespace}-sg-instance-${local.instance.name}"

  ingress {
    from_port   = local.instance.allow_access.port
    to_port     = local.instance.allow_access.port
    protocol    = "tcp"
    cidr_blocks = local.instance.allow_access.cidr_blocks #tfsec:ignore:aws-ec2-no-public-ingress-sgr
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-ec2-no-public-egress-sgr
  }

  tags = {
    Name = "${local.namespace}-sg-instance-${local.instance.name}"
  }
}

resource "aws_instance" "this" {
  ami                         = local.instance.ami
  instance_type               = local.instance.instance_type
  associate_public_ip_address = local.instance.associate_public_ip_address
  vpc_security_group_ids      = [aws_security_group.this.id]

  tags = {
    Name = "${local.namespace}-instance-${local.instance.name}"
  }
}
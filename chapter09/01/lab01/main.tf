resource "aws_security_group" "this" {
  name = "${local.namespace}-sg"

  ingress {
from_port   = local.allow_access.port
  to_port     = local.allow_access.port
          protocol    = "tcp"
    cidr_blocks = local.allow_access.cidr_blocks
  }

  tags = {
    Name = "${local.namespace}-sg"
  }
}
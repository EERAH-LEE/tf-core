output "instance" {
  value = {
    (local.instance.name) = {
     id = aws_instance.this.id
     public_ip = aws_instance.this.public_ip
    }
  }
}

output "sg" {
  value = {
    id = aws_security_group.this.id
    name = aws_security_group.this.name
  }
}

output "iamprofile" {
  value = {
    name = aws_iam_instance_profile.this.name
  }
}

output "iamrole" {
  value = {
    (local.iamrole.name) = {
      arn = aws_iam_role.this.arn
    }
  }
}

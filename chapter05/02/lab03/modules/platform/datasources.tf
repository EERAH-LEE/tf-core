data "aws_iam_policy" "aws_ssm_core" {
  name = "AmazonSSMManagedInstanceCore"
}

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
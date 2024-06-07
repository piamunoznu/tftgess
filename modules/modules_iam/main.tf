resource "aws_iam_policy" "ssmpolicyec2" {
  name        = var.datapolicy.name
  description = var.datapolicy.desc

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "ssm:GetDocument",
            "Resource": "arn:aws:ssm:us-east-1:308469693871:document/SSM-SessionManagerRunShell",
            "Condition": {
                "BoolIfExists": {
                    "ssm:SessionDocumentAccessCheck": "true"
                }
            }
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "ssm:StartSession",
            "Resource": "arn:aws:ec2:*:*:instance/*"
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances",
                "ssm:GetConnectionStatus",
                "ssm:DescribeSessions",
                "ssm:DescribeInstanceProperties"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": "ssm:TerminateSession",
            "Resource": "arn:aws:ssm:*:*:session/*"
        }
    ]
})
}

resource "aws_iam_role_policy" "ec2inlinepolicy" {
  name = var.datarole.inlinepname
  role = aws_iam_role.instancerole-ec2.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_instance_profile" "ec2Profile" {
  name = var.datarole.profilerole
  role = aws_iam_role.instancerole-ec2.name
}

resource "aws_iam_role" "instancerole-ec2" {
  name               = "InstanceRoleEC2"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "policyattachrole" {
  role       = aws_iam_role.instancerole-ec2.name
  policy_arn = aws_iam_policy.ssmpolicyec2.arn
}
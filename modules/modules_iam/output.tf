output "sessionpolicy" {
    value = aws_iam_policy.ssmpolicyec2.arn
}

output "role-arn" {
    value = aws_iam_instance_profile.ec2Profile.arn
}

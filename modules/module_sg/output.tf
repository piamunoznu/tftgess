output "albsgid" {
  value = aws_security_group.elbpublicsg.id
}

output "websg" {
  value = aws_security_group.ec2publicsg.id
}
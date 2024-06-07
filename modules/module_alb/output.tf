output "albdns" {
  description = "**Take this DNS of the AWS ALB**"
  value       = aws_lb.tfalb.dns_name
}

output "tgarn" {
  value = aws_lb_target_group.albtg.arn
}
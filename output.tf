output "policyoutput" {
    value = module.iamrole.sessionpolicy
}

output "roleoutput" {
    value = module.iamrole.role-arn
}

output "subnetid" {
  value = module.awsvpc.pubsubnet
}

output "subnetid2" {
  value = module.awsvpc.privsubnet
}

output "idsgalb" {
  value = module.awssg.albsgid
}

output "idsgweb" {
  value = module.awssg.websg
}

output "dnsalb" {
  description = "**Take this DNS of the AWS ALB**"
  value       = module.awslb.albdns
}

output "arntg" {
  value = module.awslb.tgarn
}
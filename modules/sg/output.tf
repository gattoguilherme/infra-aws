output "arns" {
  value = zipmap([for x in aws_security_group.main : x.name], [for x in aws_security_group.main : x.id])
}
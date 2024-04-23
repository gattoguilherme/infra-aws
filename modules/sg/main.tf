resource "aws_security_group" "main" {
  for_each = var.security_group_config
  name          = each.key
  description   = each.value.description
  vpc_id        = each.value.vpc_id

  ingress {
    protocol    = each.value.ingress-protocol
    from_port   = each.value.ingress-from_port
    to_port     = each.value.ingress-to_port
    cidr_blocks = each.value.ingress-cidr_blocks
  } 

  egress {
    protocol    = each.value.egress-protocol
    from_port   = each.value.egress-from_port
    to_port     = each.value.egress-to_port
    cidr_blocks = each.value.egress-cidr_blocks
  }
}
resource "aws_alb" "main" {
  name                      = var.load_balancer_config.lb_name
  subnets                   = var.load_balancer_config.subnets
  security_groups           = [lookup(var.sg_arns, join("-", [var.load_balancer_config.lb_name, "sg"]))]
  load_balancer_type = "application"
  enable_deletion_protection = false
}

resource "aws_alb_target_group" "main" {
    name                    = var.load_balancer_config.tg_name
    port                    = var.load_balancer_config.port
    protocol                = var.load_balancer_config.protocol
    vpc_id                  = var.load_balancer_config.vpc_id
    target_type             = var.load_balancer_config.target_type

    health_check {
        healthy_threshold   = var.load_balancer_config.healthy_threshold
        interval            = var.load_balancer_config.interval
        protocol            = var.load_balancer_config.protocol
        matcher             = var.load_balancer_config.matcher
        timeout             = var.load_balancer_config.timeout
        path                = var.load_balancer_config.path
        unhealthy_threshold = var.load_balancer_config.unhealthy_threshold
    }
}

resource "aws_alb_listener" "main" {
  load_balancer_arn = aws_alb.main.id
  port              = var.load_balancer_config.app_port
  protocol          = var.load_balancer_config.protocol

  default_action {
    target_group_arn = aws_alb_target_group.main.id
    type             = var.load_balancer_config.type
  }
}
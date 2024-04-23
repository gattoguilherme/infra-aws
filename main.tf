module "sg" {
  source                = "./modules/sg"
  security_group_config = var.security_group_config
}

module "lb" {
  source                = "./modules/lb"
  load_balancer_config  = var.load_balancer_config
  sg_arns               = module.sg.arns
}
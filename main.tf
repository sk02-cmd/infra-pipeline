module "vpc" {

  source = "./modules/vpc"

  environment        = var.environment
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
}

module "security_group" {

  source = "./modules/security-group"

  environment = var.environment
  vpc_id      = module.vpc.vpc_id
}

module "ec2" {

  source = "./modules/ec2"

  environment       = var.environment
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.sg_id
  instance_type     = var.instance_type
  ami_id            = var.ami_id
}
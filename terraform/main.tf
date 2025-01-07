module "networking" {
  source             = "./modules/networking"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
}

module "security" {
  source = "./modules/security"
  # Security module needs to know which VPC to create rules in
  vpc_id = module.networking.vpc_id
}

module "compute" {
  source                = "./modules/compute"
  ami_id                = var.ami_id
  subnet_id             = module.networking.public_subnet_id
  security_group_id     = module.security.security_group_id
  instance_type         = var.instance_type
  docker_image          = var.docker_image
  key_pair              = var.key_pair
  instance_profile_name = module.security.instance_profile_name


  # We depend on both networking and security being set up first
  depends_on = [
    module.networking,
    module.security
  ]
}
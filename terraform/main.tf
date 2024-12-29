module "networking" {
  source = "./modules/networking"

  # Pass in our networking-related variables
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  project_name       = var.project_name
}

module "security" {
  source = "./modules/security"

  # The security module needs to know which VPC to create rules in
  vpc_id       = module.networking.vpc_id
  project_name = var.project_name
}

module "compute" {
  source = "./modules/compute"

  subnet_id         = module.networking.public_subnet_id
  security_group_id = module.security.security_group_id
  instance_type     = var.instance_type
  docker_image      = var.docker_image
  project_name      = var.project_name

  # We depend on both networking and security being set up first
  depends_on = [
    module.networking,
    module.security
  ]
}
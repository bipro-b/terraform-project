terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "network" {
  source       = "../../modules/network"
  project_name = var.project_name
}

module "security" {
  source           = "../../modules/security"
  project_name     = var.project_name
  vpc_id           = module.network.vpc_id
  app_port         = var.app_port
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

module "ecr" {
  source    = "../../modules/ecr"
  repo_name = "${var.project_name}-repo"
}

module "compute" {
  source             = "../../modules/compute"
  project_name       = var.project_name
  instance_type      = var.instance_type
  subnet_id          = module.network.public_subnet_id
  security_group_ids = [module.security.instance_sg_id]
  region             = var.region
  app_port           = var.app_port
  ecr_repo_url       = module.ecr.repository_url
  image_tag          = var.image_tag
  key_name           = var.key_name
}

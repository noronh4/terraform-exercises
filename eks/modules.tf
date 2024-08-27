module "eks_network" {
  source       = "./modules/network"
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source           = "./modules/cluster"
  project_name     = var.project_name
  tags             = local.tags
  subnet_public_1a = module.eks_network.eks_subnet_public_1a
  subnet_public_1b = module.eks_network.eks_subnet_public_1b
}
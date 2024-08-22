module "eks_network" {
  source       = "./modules/network"
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source       = "./modules/cluster"
  project_name = var.project_name
  tags         = local.tags
}
module "eks_network" {
  source       = "./modules/network"
  project_name = var.project_name
  tags         = local.tags
}
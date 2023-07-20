# invoking vnet and subnets modules
module "vnet_with_subnets" {
  # invoke vnet_and_subnets module under modules directory
  source = "../modules/vnet_and_subnets"

  # create resource group, vnet and subnet with the same name as cluster name
  resource_group_name = var.cluster_name
  vnet_name           = var.cluster_name
  subnet_name         = var.cluster_name

  # location where the resources need to be created
  region = var.region

  address_space         = var.address_space
  subnet_address_prefix = var.address_space
}

# invoking aks module to create aks cluster and node group
module "aks_with_node_group" {
  # invoke aks module under modules directory
  source = "../modules/aks"

  cluster_name        = var.cluster_name
  k8s_version         = var.k8s_version
  region              = var.region
  dns_prefix          = var.cluster_name
  resource_group_name = module.vnet_with_subnets.az_rg_name
  az_subnet_id        = module.vnet_with_subnets.az_subnet_id
  nodepools           = var.nodepools
}
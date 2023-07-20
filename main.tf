# to use s3 backend 
# s3 bucket is configured at command line
terraform {
  backend "s3" {}
}

provider "azurerm" {
  # The AzureRM Provider supports authenticating using via the Azure CLI, a Managed Identity
  # and a Service Principal. More information on the authentication methods supported by
  # the AzureRM Provider can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#authenticating-to-azure

  # The features block allows changing the behaviour of the Azure Provider, more
  # information can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block
  features {}
}

# invoke cluster module which creates resource group, vnet, subnets and aks cluter with a default nodepool
# by default cluster module also creates a nodepool named worker
module "cluster" {
  source = "./cluster"

  region       = var.region
  cluster_name = var.cluster_name
  k8s_version  = var.k8s_version
}
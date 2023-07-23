# aks module

This is the documentation for aks module.

## Summary

This module creates following resources -
- aks cluster with a default system nodepool
- optionally you can create worker nodepools

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.65.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =3.65.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.k8s](https://registry.terraform.io/providers/hashicorp/azurerm/3.65.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.k8s-worker](https://registry.terraform.io/providers/hashicorp/azurerm/3.65.0/docs/resources/kubernetes_cluster_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks_tags"></a> [aks\_tags](#input\_aks\_tags) | tags for the aks cluster | `map(any)` | `{}` | no |
| <a name="input_az_subnet_id"></a> [az\_subnet\_id](#input\_az\_subnet\_id) | azure subnet id where the nodepools and eks cluster need to be created | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | aks cluster name | `string` | n/a | yes |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | DNS prefix specified when creating the managed cluster. Possible values must begin and end with a letter or number, contain only letters, numbers, and hyphens and be between 1 and 54 characters in length. Changing this forces a new resource to be created. | `string` | `"platformwale"` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | kubernetes version | `string` | `"1.26"` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Network plugin to use for networking. Currently supported values are azure, kubenet and none. Changing this forces a new resource to be created. | `string` | `"none"` | no |
| <a name="input_nodepools"></a> [nodepools](#input\_nodepools) | Nodepools for the Kubernetes cluster | <pre>map(object({<br>    name                  = string<br>    zones                 = list(number)<br>    vm_size               = string<br>    min_count             = number<br>    max_count             = number<br>    enable_auto_scaling   = bool<br>    enable_node_public_ip = bool<br>    tags                  = map(string)<br>    node_labels           = map(string)<br>  }))</pre> | <pre>{<br>  "worker": {<br>    "enable_auto_scaling": true,<br>    "enable_node_public_ip": true,<br>    "max_count": 100,<br>    "min_count": 1,<br>    "name": "worker",<br>    "node_labels": {<br>      "worker-name": "worker"<br>    },<br>    "tags": {<br>      "worker_name": "worker"<br>    },<br>    "vm_size": "Standard_D2_v2",<br>    "zones": [<br>      1,<br>      2,<br>      3<br>    ]<br>  }<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | azure region where the aks cluster must be created, this region should match where you have created the resource group, vnet and subnet | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | azure resource group name where the aks cluster should be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The Kubernetes Managed Cluster ID. |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | Raw Kubernetes config to be used by kubectl and other compatible tools. |
| <a name="output_node_resource_group"></a> [node\_resource\_group](#output\_node\_resource\_group) | The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster. |
| <a name="output_node_resource_group_id"></a> [node\_resource\_group\_id](#output\_node\_resource\_group\_id) | The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster. |
| <a name="output_oidc_issuer_url"></a> [oidc\_issuer\_url](#output\_oidc\_issuer\_url) | The OIDC issuer URL that is associated with the cluster |

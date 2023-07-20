# cluster

This is top level module creates resource group, vnet, subnets and aks cluster by calling [vnet_and_subnets](../modules/vnet_and_subnets/README.md) and [aks](../modules/aks/README.md) modules.

## Summary

This module creates following resources -
- Resource Group
- VPC (VNET)
- Subnet
- AKS Cluster with a default nodepool
- Optionally can create other k8s worker nodepools

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks_with_node_group"></a> [aks\_with\_node\_group](#module\_aks\_with\_node\_group) | [aks](../modules/aks) | n/a |
| <a name="module_vnet_with_subnets"></a> [vnet\_with\_subnets](#module\_vnet\_with\_subnets) | [vnet_and_subnets](../modules/vnet_and_subnets) | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used the virtual network. You can supply more than one address space but for our module implementation we are limiting it to 1 address space only. | `list(string)` | <pre>[<br>  "10.1.0.0/16"<br>]</pre> | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | resource group, vnet, subnet and aks cluster name | `string` | n/a | yes |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | kubernetes version | `string` | `"1.26"` | no |
| <a name="input_nodepools"></a> [nodepools](#input\_nodepools) | Nodepools for the Kubernetes cluster | <pre>map(object({<br>    name                  = string<br>    zones                 = list(number)<br>    vm_size               = string<br>    min_count             = number<br>    max_count             = number<br>    enable_auto_scaling   = bool<br>    enable_node_public_ip = bool<br>    tags                  = map(string)<br>    node_labels           = map(string)<br>  }))</pre> | <pre>{<br>  "worker": {<br>    "enable_auto_scaling": true,<br>    "enable_node_public_ip": true,<br>    "max_count": 100,<br>    "min_count": 1,<br>    "name": "worker",<br>    "node_labels": {<br>      "worker-name": "worker"<br>    },<br>    "tags": {<br>      "worker_name": "worker"<br>    },<br>    "vm_size": "Standard_D2_v2",<br>    "zones": [<br>      1,<br>      2,<br>      3<br>    ]<br>  }<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | azure region where the aks cluster must be created, this region should match where you have created the resource group, vnet and subnet | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_rg_id"></a> [az\_rg\_id](#output\_az\_rg\_id) | The ID of the resource group |
| <a name="output_az_rg_name"></a> [az\_rg\_name](#output\_az\_rg\_name) | The name of the resource group |
| <a name="output_az_subnet_id"></a> [az\_subnet\_id](#output\_az\_subnet\_id) | The ID of the subnet |
| <a name="output_az_vnet_id"></a> [az\_vnet\_id](#output\_az\_vnet\_id) | The ID of the vnet |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The Kubernetes Managed Cluster ID. |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | Raw Kubernetes config to be used by kubectl and other compatible tools. |
| <a name="output_node_resource_group"></a> [node\_resource\_group](#output\_node\_resource\_group) | The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster. |
| <a name="output_node_resource_group_id"></a> [node\_resource\_group\_id](#output\_node\_resource\_group\_id) | The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster. |
| <a name="output_oidc_issuer_url"></a> [oidc\_issuer\_url](#output\_oidc\_issuer\_url) | The OIDC issuer URL that is associated with the cluster |
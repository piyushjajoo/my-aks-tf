output "kube_config" {
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools."
  value       = module.cluster.kube_config
  sensitive   = true
}

output "oidc_issuer_url" {
  description = "The OIDC issuer URL that is associated with the cluster"
  value       = module.cluster.oidc_issuer_url
}

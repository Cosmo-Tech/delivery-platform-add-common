data "terraform_remote_state" "state" {
  count   = var.backend_remote ? 1 : 0
  backend = "azurerm"
  config = {
    resource_group_name  = var.tf_resource_group_name
    storage_account_name = var.tf_storage_account_name
    container_name       = var.tf_container_name
    key                  = var.tf_blob_name
    access_key           = var.tf_access_key
  }
}

module "cosmotech-tenant" {
  source  = "Cosmo-Tech/cosmotech-common/azure"
  version = "0.2.10"

  subscription_id        = var.subscription_id
  tenant_id              = var.tenant_id
  client_id              = var.client_id
  client_secret          = var.client_secret
  tls_secret_name        = var.tls_secret_name
  namespace              = var.namespace
  monitoring_namespace   = var.monitoring_namespace
  owner_list             = var.owner_list
  project_name           = var.project_name
  cluster_name           = var.cluster_name
  vnet_iprange           = var.vnet_iprange
  dns_record             = var.dns_record
  deployment_type        = var.deployment_type
  adt_principal_id       = var.adt_principal_id
  platform_client_id     = var.platform_client_id
  platform_client_secret = var.platform_client_secret
  kubernetes_version     = var.kubernetes_version
}
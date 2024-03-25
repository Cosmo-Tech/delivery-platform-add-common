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

module "cosmotech-common" {
  source  = "Cosmo-Tech/cosmotech-common/azure"
  version = "1.0.2"

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  location        = var.location

  resource_group   = var.resource_group
  cluster_name     = var.cluster_name
  deployment_type  = var.deployment_type
  image_path       = var.image_path
  platform_url     = var.platform_url
  identifier_uri   = var.identifier_uri
  owner_list       = var.owner_list
  audience         = var.audience
  api_version_path = var.api_version_path

  # publicip
  publicip_new_or_existing_or_none = var.publicip_new_or_existing_or_none
  create_dnsrecord                 = var.create_dnsrecord
  publicip_resource_group          = var.publicip_resource_group
  project_stage                    = var.project_stage
  project_name                     = var.project_name
  customer_name                    = var.customer_name
  dns_record                       = var.dns_record
  dns_zone_name                    = var.dns_zone_name
  dns_zone_rg                      = var.dns_zone_rg

  # network common
  network_client_id     = var.network_client_id
  network_client_secret = var.network_client_secret
  network_sp_object_id  = var.network_sp_object_id

  # vnet
  vnet_new                              = var.vnet_new
  vnet_name                             = var.vnet_name
  subnet_name                           = var.subnet_name
  vnet_resource_group                   = var.vnet_resource_group
  virtual_network_address_prefix        = var.virtual_network_address_prefix
  virtual_network_subnet_address_prefix = var.virtual_network_subnet_address_prefix

  # privatelink dns
  private_dns_name_blob     = var.private_dns_name_blob
  private_dns_name_queue    = var.private_dns_name_queue
  private_dns_name_table    = var.private_dns_name_table
  private_dns_name_adt      = var.private_dns_name_adt
  private_dns_name_eventhub = var.private_dns_name_eventhub

  kubernetes_version                          = var.kubernetes_version
  kubernetes_max_db_instances                 = var.kubernetes_max_db_instances
  kubernetes_min_db_instances                 = var.kubernetes_min_db_instances
  kubernetes_max_services_instances           = var.kubernetes_max_services_instances
  kubernetes_max_monitoring_instances         = var.kubernetes_max_monitoring_instances
  kubernetes_max_highmemory_compute_instances = var.kubernetes_max_highmemory_compute_instances
  kubernetes_max_highcpu_compute_instances    = var.kubernetes_max_highcpu_compute_instances
  kubernetes_max_basic_compute_instances      = var.kubernetes_max_basic_compute_instances
  kubernetes_db_type                          = var.kubernetes_db_type
  kubernetes_services_type                    = var.kubernetes_services_type
  kubernetes_monitoring_type                  = var.kubernetes_monitoring_type
  kubernetes_highmemory_compute_type          = var.kubernetes_highmemory_compute_type
  kubernetes_highcpu_compute_type             = var.kubernetes_highcpu_compute_type
  kubernetes_basic_compute_type               = var.kubernetes_basic_compute_type
  kubernetes_nodepool_system_type             = var.kubernetes_nodepool_system_type
  kubernetes_network_plugin                   = var.kubernetes_network_plugin

  # Cosmo Tech platform
  namespace                          = var.namespace
  monitoring_namespace               = var.monitoring_namespace
  ingress_nginx_version              = var.ingress_nginx_version
  create_prometheus_stack            = var.create_prometheus_stack
  cluster_issuer_email               = var.cluster_issuer_email
  cluster_issuer_name                = var.cluster_issuer_name
  tls_secret_name                    = var.tls_secret_name
  tls_certificate_type               = var.tls_certificate_type
  tls_certificate_custom_certificate = var.tls_certificate_custom_certificate
  tls_certificate_custom_key         = var.tls_certificate_custom_key
}

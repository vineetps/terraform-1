provider "azurerm" {
 client_id = "{{env `TF_VAR_client_id`}}"
 subscription_id = "{{env `TF_VAR_subscription_id`}}"
 client_secret = "{{env `TF_VAR_client_secret`}}"
 tenant_id = "{{env `TF_VAR_tenant_id`}}"
}

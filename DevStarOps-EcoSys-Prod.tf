resource "azuread_application" "eco-production" {
  display_name = "DevStarOps-EcoSys-Prod"
}

resource "azuread_service_principal" "eco-production" {
  application_id = "${azuread_application.eco-production.application_id}"
}

resource "azurerm_role_assignment" "shared-storage-production-reader" {
  scope                = data.azurerm_storage_account.shared.id
  role_definition_name = "Reader and Data Access"
  principal_id         = azuread_service_principal.eco-production.object_id
}

resource "azurerm_role_assignment" "rg-production-owner" {
  scope                = azurerm_resource_group.production.id
  role_definition_name = "Owner"
  principal_id         = azuread_service_principal.eco-production.object_id
}

resource "azuread_service_principal_password" "eco-production" {
  service_principal_id = azuread_service_principal.eco-production.id
  end_date_relative    = "2400h30m"
}

output "production_app" {
  value = azuread_application.eco-production.display_name
}

output "production_client_id" {
  value = azuread_application.eco-production.application_id
}

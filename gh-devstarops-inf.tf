
data "github_repository" "devstarops-inf" {
  full_name = "DevStarOps/devstarops-inf"
}

resource "github_repository_environment" "test-inf" {
  environment  = "test"
  repository   = data.github_repository.devstarops-inf.id
}

resource "github_repository_environment" "production-inf" {
  environment  = "production"
  repository   = data.github_repository.devstarops-inf.id
  reviewers {
    users = [data.github_user.current.id]
  }
  
}

resource "github_branch_protection" "devstarops-inf-main" {
  repository_id = data.github_repository.devstarops-inf.id
  pattern          = "main"
  enforce_admins   = true
  require_signed_commits = true
}

## Secrets

# ARM_CLIENT_ID
resource "github_actions_environment_secret" "test-inf-ARM_CLIENT_ID" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.test-inf.environment
  secret_name      = "ARM_CLIENT_ID"
  plaintext_value  = azuread_application.eco-test.application_id
}
resource "github_actions_environment_secret" "production-inf-ARM_CLIENT_ID" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.production-inf.environment
  secret_name      = "ARM_CLIENT_ID"
  plaintext_value  = azuread_application.eco-production.application_id
}

# ARM_TENANT_ID
resource "github_actions_environment_secret" "test-inf-ARM_TENANT_ID" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.test-inf.environment
  secret_name      = "ARM_TENANT_ID"
  plaintext_value  = data.azurerm_client_config.current.tenant_id
}
resource "github_actions_environment_secret" "production-inf-ARM_TENANT_ID" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.production-inf.environment
  secret_name      = "ARM_TENANT_ID"
  plaintext_value  = data.azurerm_client_config.current.tenant_id
}

# ARM_SUBSCRIPTION_ID
resource "github_actions_environment_secret" "test-inf-ARM_SUBSCRIPTION_ID" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.test-inf.environment
  secret_name      = "ARM_SUBSCRIPTION_ID"
  plaintext_value  = data.azurerm_client_config.current.subscription_id
}
resource "github_actions_environment_secret" "production-inf-ARM_SUBSCRIPTION_ID" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.production-inf.environment
  secret_name      = "ARM_SUBSCRIPTION_ID"
  plaintext_value  = data.azurerm_client_config.current.subscription_id
}

# ARM_CLIENT_SECRET
resource "github_actions_environment_secret" "test-inf-ARM_CLIENT_SECRET" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.test-inf.environment
  secret_name      = "ARM_CLIENT_SECRET"
  plaintext_value  = azuread_service_principal_password.eco-test.value
}
resource "github_actions_environment_secret" "production-inf-ARM_CLIENT_SECRET" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.production-inf.environment
  secret_name      = "ARM_CLIENT_SECRET"
  plaintext_value  = azuread_service_principal_password.eco-production.value
}

# FRONTDOOR_ADMIN_USER
resource "github_actions_environment_secret" "test-inf-FRONTDOOR_ADMIN_USER" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.test-inf.environment
  secret_name      = "FRONTDOOR_ADMIN_USER"
  plaintext_value  = var.test_frontdoor_admin_user
}
resource "github_actions_environment_secret" "production-inf-FRONTDOOR_ADMIN_USER" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.production-inf.environment
  secret_name      = "FRONTDOOR_ADMIN_USER"
  plaintext_value  = var.production_frontdoor_admin_user
}

# FRONTDOOR_ADMIN_PASSWORD
resource "github_actions_environment_secret" "test-inf-FRONTDOOR_ADMIN_PASSWORD" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.test-inf.environment
  secret_name      = "FRONTDOOR_ADMIN_PASSWORD"
  plaintext_value  = var.test_frontdoor_admin_password
}
resource "github_actions_environment_secret" "production-inf-FRONTDOOR_ADMIN_PASSWORD" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.production-inf.environment
  secret_name      = "FRONTDOOR_ADMIN_PASSWORD"
  plaintext_value  = var.production_frontdoor_admin_password
}

# APP1_ADMIN_USER
resource "github_actions_environment_secret" "test-inf-APP1_ADMIN_USER" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.test-inf.environment
  secret_name      = "APP1_ADMIN_USER"
  plaintext_value  = var.test_app1_admin_user
}
resource "github_actions_environment_secret" "production-inf-APP1_ADMIN_USER" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.production-inf.environment
  secret_name      = "APP1_ADMIN_USER"
  plaintext_value  = var.production_app1_admin_user
}

# APP1_ADMIN_PASSWORD
resource "github_actions_environment_secret" "test-inf-APP1_ADMIN_PASSWORD" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.test-inf.environment
  secret_name      = "APP1_ADMIN_PASSWORD"
  plaintext_value  = var.test_app1_admin_password
}
resource "github_actions_environment_secret" "production-inf-APP1_ADMIN_PASSWORD" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.production-inf.environment
  secret_name      = "APP1_ADMIN_PASSWORD"
  plaintext_value  = var.production_app1_admin_password
}


# CLOUDFLARE_ZONE_ID
resource "github_actions_environment_secret" "test-inf-CLOUDFLARE_ZONE_ID" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.test-inf.environment
  secret_name      = "CLOUDFLARE_ZONE_ID"
  plaintext_value  = var.cloudflare_zone_id
}
resource "github_actions_environment_secret" "production-inf-CLOUDFLARE_ZONE_ID" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.production-inf.environment
  secret_name      = "CLOUDFLARE_ZONE_ID"
  plaintext_value  = var.cloudflare_zone_id
}

# CLOUDFLARE_EMAIL
resource "github_actions_environment_secret" "test-inf-CLOUDFLARE_EMAIL" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.test-inf.environment
  secret_name      = "CLOUDFLARE_EMAIL"
  plaintext_value  = var.cloudflare_email
}
resource "github_actions_environment_secret" "production-inf-CLOUDFLARE_EMAIL" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.production-inf.environment
  secret_name      = "CLOUDFLARE_EMAIL"
  plaintext_value  = var.cloudflare_email
}

# CLOUDFLARE_API_KEY
resource "github_actions_environment_secret" "test-inf-CLOUDFLARE_API_KEY" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.test-inf.environment
  secret_name      = "CLOUDFLARE_API_KEY"
  plaintext_value  = var.cloudflare_api_key
}
resource "github_actions_environment_secret" "production-inf-CLOUDFLARE_API_KEY" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.production-inf.environment
  secret_name      = "CLOUDFLARE_API_KEY"
  plaintext_value  = var.cloudflare_api_key
}


# GITHUB_TOKEN
resource "github_actions_environment_secret" "test-inf-GITHUB_TOKEN" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.test-inf.environment
  secret_name      = "GH_TOKEN"
  plaintext_value  = var.github_token
}
resource "github_actions_environment_secret" "production-inf-GITHUB_TOKEN" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.production-inf.environment
  secret_name      = "GH_TOKEN"
  plaintext_value  = var.github_token
}


# SNYK_TOKEN
resource "github_actions_environment_secret" "test-inf-SNYK_TOKEN" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.test-inf.environment
  secret_name      = "SNYK_TOKEN"
  plaintext_value  = var.snyk_token
}
resource "github_actions_environment_secret" "production-inf-SNYK_TOKEN" {
  repository       = data.github_repository.devstarops-inf.id
  environment      = github_repository_environment.production-inf.environment
  secret_name      = "SNYK_TOKEN"
  plaintext_value  = var.snyk_token
}
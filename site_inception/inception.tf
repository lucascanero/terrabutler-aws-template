module "backends" {

  source = "bitbucket.org/asolidodev/my_inception.git?use-official-modules"

  for_each = var.include_inception_project ? toset(concat(var.inception_projects, ["inception"])) : toset(var.inception_projects)

  my_inception_organization          = var.organization
  my_inception_environment           = var.environment
  my_inception_domain                = "site"
  my_inception_project               = each.key
  my_inception_enable_versioning     = var.enable_versioning
  my_inception_disable_force_destroy = var.disable_force_destroy
}

resource "local_file" "backend_configs" {

  for_each = var.include_inception_project ? toset(concat(var.inception_projects, ["inception"])) : toset(var.inception_projects)

  content = templatefile("backend.tpl", {
    organization = var.organization,
    environment  = var.environment,
    site         = each.key,
    profile      = var.provider_profile,
    region       = var.provider_region
    }
  )
  filename        = "../configs/backends/${var.organization}-${var.environment}-${each.key}.tfvars"
  file_permission = "0664"
}

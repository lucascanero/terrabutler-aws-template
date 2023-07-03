module "backends" {

  source = "git@github.com:montblu/my_inception.git?ref=2.0.1"

  for_each = var.include_inception_project ? toset(concat(var.inception_projects, ["inception"])) : toset(var.inception_projects)

  name        = each.key
  name_prefix = local.resource_name_prefix
  profile     = var.provider_profile
  region      = var.provider_region
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

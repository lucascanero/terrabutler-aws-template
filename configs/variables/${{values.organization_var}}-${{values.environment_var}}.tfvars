provider_region  = ${{values.region_var | dump}}
provider_profile = "${{values.organization_var}}-${{values.environment_var}}"
environment      = ${{values.environment_var | dump}}
domain           = ${{values.domain_var | dump}}

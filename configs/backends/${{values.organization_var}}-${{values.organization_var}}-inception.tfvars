region         = ${{values.region_var | dump}}
profile        = "${{values.organization_var}}-${{values.organization_var}}"
key            = "${{values.environment_var}}-inception.tfstate"
bucket         = "${{values.organization_var}}-${{values.environment_var}}-site-inception-tfstate"
dynamodb_table = "${{values.organization_var}}_${{values.environment_var}}_site_inception_tfstatelock"

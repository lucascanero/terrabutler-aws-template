#!/bin/bash
#USAGE:
#   ./config_template [FLAG] [STRING]
#FLAGS:
#    -o <organization_name>   The name for your organization
#
#    -d <domain>              The domain of your organization

#    -e <environment_name>    The environment name of your organization
#
while getopts d:e:o: flag
do
    case "${flag}" in
        d) domain=${OPTARG};;
        e) env=${OPTARG};;
        o) organization=${OPTARG};;
        *) echo "usage: $0 [-d <domain>] [-e <environment>] [ -o <organization>]" >&2
    esac
done
# Rename configs/backends/*.tfvars
mv configs/backends/organization-env-inception.tfvars configs/backends/"$organization"-"$env"-inception.tfvars 
# Rename configs/variables/*.tfvars
mv configs/variables/organization-env-inception.tfvars configs/variables/"$organization"-"$env"-inception.tfvars 
mv configs/variables/organization-env.tfvars configs/variables/"$organization"-"$env".tfvars 

# Replace strings with the variables
sed -i "s/organization_var/$organization/" configs/backends/"$organization"-"$env"-inception.tfvars 

sed -i "s/organization_var/$organization/" configs/variables/"$organization"-"$env"-inception.tfvars 
sed -i "s/organization_var/$organization/" configs/variables/"$organization"-"$env".tfvars 
sed -i "s/organization_var/$organization/" configs/variables/global.tfvars 

sed -i "s/organization_var/$organization/" configs/settings.yml


sed -i "s/env_var/$env/" configs/backends/"$organization"-"$env"-inception.tfvars 

sed -i "s/env_var/$env/" configs/variables/"$organization"-"$env"-inception.tfvars 
sed -i "s/env_var/$env/" configs/variables/"$organization"-"$env".tfvars 

sed -i "s/env_var/$env/" configs/settings.yml


sed -i "s/domain_var/$domain/" configs/variables/"$organization"-"$env".tfvars 

sed -i "s/domain_var/$domain/" configs/settings.yml

echo "Template Configuration replaced!"
exit 

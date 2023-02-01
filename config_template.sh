#!/bin/bash
#USAGE:
#   ./config_template [FLAG] [STRING]
#FLAGS:
#    -o <organization_name>   The name for your organization
#    -d <domain>              The domain of your organization
#    -e <environment_name>    The environment name of your organization
#    -r <region>              The region to be used
#
while getopts d:e:o:r: flag; do
    case "${flag}" in
    d) domain=${OPTARG} ;;
    e) env=${OPTARG} ;;
    o) organization=${OPTARG} ;;
    r) region=${OPTARG} ;;
    *) echo "usage: $0 [-d <domain>] [-e <environment>] [ -o <organization>] [ -r <region>]" >&2 ;;
    esac
done
# Rename configs/backends/*.tfvars
mv configs/backends/organization-env-inception.tfvars configs/backends/"$organization"-"$env"-inception.tfvars
# Rename configs/variables/*.tfvars
mv configs/variables/organization-env-inception.tfvars configs/variables/"$organization"-"$env"-inception.tfvars
mv configs/variables/organization-env.tfvars configs/variables/"$organization"-"$env".tfvars

# Replace strings with the variables
find configs/ -type f -exec sed -i "s/${{values.region_var}}/$region/" {} +
find configs/ -type f -exec sed -i "s/${{values.domain_var}}/$domain/" {} +
find configs/ -type f -exec sed -i "s/${{values.environment_var}}/$env/" {} +
find configs/ -type f -exec sed -i "s/${{values.organization_var}}/$organization/" {} +

echo "Template Configuration replaced!"
exit

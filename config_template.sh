#!/bin/bash
#USAGE:
#   ./config_template [FLAG] [STRING]
#FLAGS:
#    -p <project_name>        The name for your project
#
#    -d <domain>              The domain of your project

#    -e <enviroment_name>     The enviroment name of your project
#
while getopts d:e:p: flag
do
    case "${flag}" in
        d) domain=${OPTARG};;
        e) env=${OPTARG};;
        p) project=${OPTARG};;
        *) echo "usage: $0 [-d <domain>] [-e <environment>] [ -p <project>]" >&2
    esac
done
# Rename configs/backends/*.tfvars
mv configs/backends/project-env-inception.tfvars configs/backends/"$project"-"$env"-inception.tfvars 
# Rename configs/variables/*.tfvars
mv configs/variables/project-env-inception.tfvars configs/variables/"$project"-"$env"-inception.tfvars 
mv configs/variables/project-env.tfvars configs/variables/"$project"-"$env".tfvars 

# Replace strings with the variables
sed -i "s/project_var/$project/" configs/backends/"$project"-"$env"-inception.tfvars 

sed -i "s/project_var/$project/" configs/variables/"$project"-"$env"-inception.tfvars 
sed -i "s/project_var/$project/" configs/variables/"$project"-"$env".tfvars 
sed -i "s/project_var/$project/" configs/variables/global.tfvars 

sed -i "s/project_var/$project/" configs/settings.yml


sed -i "s/env_var/$env/" configs/backends/"$project"-"$env"-inception.tfvars 

sed -i "s/env_var/$env/" configs/variables/"$project"-"$env"-inception.tfvars 
sed -i "s/env_var/$env/" configs/variables/"$project"-"$env".tfvars 

sed -i "s/env_var/$env/" configs/settings.yml


sed -i "s/domain_var/$domain/" configs/variables/"$project"-"$env".tfvars 

sed -i "s/domain_var/$domain/" configs/settings.yml

echo "Template Configuration replaced!"
exit 
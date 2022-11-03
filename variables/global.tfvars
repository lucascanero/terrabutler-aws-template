organization = "stm"

# Network
subnets_private_vpc             = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
subnets_private_rds_vpc         = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
subnets_private_elasticache_vpc = ["10.0.31.0/24", "10.0.32.0/24", "10.0.33.0/24"]
subnets_public_vpc              = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
vpc_cidr                        = "10.0.0.0/16"

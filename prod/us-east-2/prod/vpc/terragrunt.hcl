terraform {
  source = "git::git@github.com:slitsevych/terragrunt-example-modules.git//vpc?ref=v1.0.0"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name           = "vpc_prod"
  vpc_cidr = "172.16.100.0/20"
  public_subnets_cidr = ["172.16.100.0/24", "172.16.101.0/24"]
  private_subnets_cidr = ["172.16.102.0/24", "172.16.103.0/24"]
  db_subnets_cidr = ["172.16.104.0/24", "172.16.105.0/24"]
}

terraform {
  source = "git::git@github.com:slitsevych/terragrunt-example-modules.git//vpc?ref=v0.1.2"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name           = "vpc_stage"
  vpc_cidr = "10.0.0.0/16"
  public_subnets_cidr = ["10.0.10.0/24", "10.0.11.0/24"]
  private_subnets_cidr = ["10.0.20.0/24", "10.0.21.0/24"]
  db_subnets_cidr = ["10.0.30.0/24", "10.0.31.0/24"]
  public_route = "0.0.0.0/0"
}

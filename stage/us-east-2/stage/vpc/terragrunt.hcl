# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  #source = "git::git@github.com:gruntwork-io/terragrunt-infrastructure-modules-example.git//mysql?ref=v0.1.0"
  source = "git::git@github.com:slitsevych/terragrunt-example-modules.git//vpc?ref=v0.0.1"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name           = "vpc_stage"
  vpc_cidr = 10.0.0.0/16
  public_subnets_cidr = [10.10.10.0/24, 10.10.20.0/24]
  private_subnets_cidr = [10.10.20.0/24, 10.10.21.0/24]
  db_subnets_cidr = [10.10.30.0/24, 10.10.31.0/24]


}

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
  vpc_cidr = 172.16.100.0/20
  public_subnets_cidr = [172.16.100.0/24, 172.16.101.0/24]
  private_subnets_cidr = [172.16.102.0/24, 172.16.103.0/24]
  db_subnets_cidr = [172.16.104.0/24, 172.16.105.0/24]


}

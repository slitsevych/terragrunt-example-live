# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  #source = "git::git@github.com:gruntwork-io/terragrunt-infrastructure-modules-example.git//mysql?ref=v0.1.0"
  source = "git::git@github.com:slitsevych/terragrunt-example-modules.git//rds?ref=v0.0.1"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name           = "mysql_prod"
  instance_class = "db.t2.medium"

  allocated_storage = 30
  storage_type      = "standard"

  master_username = "admin"
  master_password = "${get_env("TF_VAR_master_password_prod", "")}"

}

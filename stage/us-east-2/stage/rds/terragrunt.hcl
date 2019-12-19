# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::git@github.com:slitsevych/terragrunt-example-modules.git//rds?ref=v0.0.22"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name           = "mysql_stage"
  instance_class = "db.t2.micro"

  allocated_storage = 20
  storage_type      = "standard"

  master_username = "admin"
  master_password = "${get_env("TF_VAR_master_password_stage", "")}"
}

dependencies {
  paths = ["../vpc"]
}

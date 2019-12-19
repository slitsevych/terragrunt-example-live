terraform {
  source = "git::git@github.com:slitsevych/terragrunt-example-modules.git//rds?ref=v0.0.23"
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

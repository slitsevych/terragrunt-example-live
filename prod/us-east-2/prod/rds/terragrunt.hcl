terraform {
  source = "git::git@github.com:slitsevych/terragrunt-example-modules.git//rds?ref=1.0.1"
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
  rds_username = "prodadmin"
  rds_port = 3306
}

dependencies {
  paths = ["../vpc"]
}

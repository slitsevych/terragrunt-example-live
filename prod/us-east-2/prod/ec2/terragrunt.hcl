terraform {
  source = "git::git@github.com:slitsevych/terragrunt-example-modules.git//ec2?ref=v1.0.0"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name          = "webserver-prod"
  instance_type = "t2.medium"
  min_size = 2
  max_size = 2
  server_port = 80
  elb_port    = 80
  my_ip = "159.224.7.123/32"
  key = "s.litsevychkeys"
}

dependencies {
  paths = ["../vpc", "../rds", ]
}

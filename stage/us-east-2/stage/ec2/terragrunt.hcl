terraform {
  source = "git::git@github.com:slitsevych/terragrunt-example-modules.git//ec2?ref=1.0.1"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name          = "webserver-stage"
  instance_type = "t2.micro"
  min_size = 2
  max_size = 2
  server_port = 80
  elb_port    = 80
  my_ip = "159.224.7.123/32"
  key = "s.litsevychkeys"
  #dbpass = "${get_env("TF_VAR_master_password_stage", "")}"
}

dependencies {
  paths = ["../vpc", "../rds", ]
}

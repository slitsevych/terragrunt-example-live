# Configure Terragrunt to automatically store tfstate files in an S3 bucket.
remote_state {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "terragrunt-example-stepan"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terragrunt-locks"
  }
}

terraform {
  extra_arguments "retry_lock" {
      commands  = get_terraform_commands_that_need_locking()
      arguments = ["-lock-timeout=20m"]
    }

  after_hook "success" {
      commands = ["apply"]
      execute = ["echo", "Changes have been applied successfully"]
      run_on_error = false
    }
  }

# ---------------------------------------------------------------------------------------------------------------------
# GLOBAL PARAMETERS
# These variables apply to all configurations in this subfolder. These are automatically merged into the child
# `terragrunt.hcl` config via the include block.
# ---------------------------------------------------------------------------------------------------------------------
locals {
  default_yaml_path = find_in_parent_folders("empty.yaml")
}

inputs = merge(
  yamldecode(
    file("${get_terragrunt_dir()}/${find_in_parent_folders("region.yaml", local.default_yaml_path)}"),
  ),
  yamldecode(
    file("${get_terragrunt_dir()}/${find_in_parent_folders("env.yaml", local.default_yaml_path)}"),
  ),
  {
    aws_profile                  = "terragrunt"
  },
)

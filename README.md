This repo, along with the terragrunt-example-modules repo, show an example file/folder structure you can use with Terragrunt
to keep your Terraform code DRY. 

This repo shows an example of how to use the modules from the terragrunt-example-modules repo to deploy a VPC, ASG with ELB
and a MySQL DB across two environments (stage, prod) all without duplicating any of the Terraform code. 
That's because there is just a single copy of the Terraform code, defined in the terragrunt-example-modules repo, 
and in this repo, we solely define terragrunt.hcl files that reference that code (at a specific version, too!) 
and fill in variables specific to each environment.

Deploying a single module

    - cd into the module's folder (e.g. cd stage/us-east-2/stage/rds).
    - run terragrunt plan to see the changes you're about to apply.
    - if the plan looks good, run terragrunt apply.

Deploying all modules in a region

    - cd into the region folder (e.g. cd stage/us-east-2).
    - run terragrunt plan-all to see all the changes you're about to apply.
    - if the plan looks good, run terragrunt apply-all.

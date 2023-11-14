terraform {
  source = "../../../modules//kms"
  # "<YOUR_GITHUB_URL>//kms?ref=<tag>"

  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

    arguments = [
      "-var-file=${get_terragrunt_dir()}/../region.tfvars"
    ]
  }
}

include {
  path = find_in_parent_folders()
}



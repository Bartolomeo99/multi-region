dependency "kms" {
  config_path = "${get_terragrunt_dir()}/../../eu-west-1/kms"
}

terraform {
  source = "../../../modules//s3"
  # "<YOUR_GITHUB_URL>//s3?ref=v1.0.1"

  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

    arguments = [
      "-var-file=${get_terragrunt_dir()}/../global.tfvars"
    ]
  }
}

include {
  path = find_in_parent_folders()
}

inputs = {
  kms_id      = dependency.kms.outputs.kms_id
  bucket_name = "<name_of_bucket>"
}       

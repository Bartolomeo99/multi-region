terraform {
  source = "../../../modules//network"
  # "<YOUR_GITHUB_URL>//network?ref=v1.0.1"

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

inputs = {
  cidr_block          = "192.168.0.0/16"
  public_cidr_block   = ["192.168.1.0/24", "192.168.2.0/24"]
  private_cidr_block  = ["192.168.3.0/24", "192.168.4.0/24"]
  av_zones            = ["eu-west-1a", "eu-west-1b"]
}


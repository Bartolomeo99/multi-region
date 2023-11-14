remote_state {
  backend = "s3"
  config = {
    bucket         = "<default_name>"
    key            = "DEV/${path_relative_to_include()}/terraform.tfstate"
    region         = "<region>"
    encrypt        = true
    dynamodb_table = "<default_name>"
    profile = "<profile>"
  }
}

locals {
  common_vars = yamldecode(file("common.yaml"))
}

inputs = {
  name = local.common_vars.environment_config.env_name
  Environment = "DEV"
#  PUBLIC_KEY_PATH  = "./mykey-pair.pub" 
#  PRIV_KEY_PATH    = "./mykey-pair"
}


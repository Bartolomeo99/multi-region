module "vpc" {
  source = "./vpc"
  vpc_cidr_block = var.cidr_block
  vpc_tags = var.tags
  name = var.name
}

module "private_subnets" {
  source = "./subnets"
  availability_zones = var.av_zones
  vpc_id = module.vpc.vpc_id
  cidrs = var.private_cidr_block
  Environment = var.Environment
  public = false
}

module "public_subnets" {
  source = "./subnets"
  availability_zones = var.av_zones
  vpc_id = module.vpc.vpc_id
  cidrs = var.public_cidr_block
  Environment = var.Environment
  public = true
}

module "nat_gateway" {
  source = "./nat"
  name = var.name
  nat_subnet = element(module.public_subnets.ids, 0)
}

module "rtb" {
  source = "./rtb"
  name = "Public"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.public_subnets.ids

  route = [
    {
      cidr_block     = var.cidr_block
      gateway_id     = "local"
    },
    {
      cidr_block     = "0.0.0.0/0"
      gateway_id     = module.vpc.igw_id
    }
  ]
}

module "private_rtb" {
  source = "./rtb"
  name = "Private"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.private_subnets.ids

  route = [
    {
      cidr_block     = var.cidr_block
      gateway_id     = "local"
    },
    {
      cidr_block     = "0.0.0.0/0"
      gateway_id     = module.nat_gateway.nat_gateway_id
    }
  ]
}


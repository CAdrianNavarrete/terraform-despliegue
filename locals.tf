locals {
  owner        = "adrian"
  region_short = replace(lower(var.location), " ", "")

  name_prefix = "${local.owner}-${lower(var.project)}-${lower(var.environment)}-${local.region_short}"

  rg_name   = "rg-cnavarrete-dev"
  workspace = "law-cnavarrete-dev"
  cae_name  = "cae-cnavarrete-dev"
  ca_name   = "ca-cnavarrete-dev"
}
 
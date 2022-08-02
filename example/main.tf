#############################################################################
# TERRAFORM PROVIDERS
#############################################################################

terraform {
  required_providers {
    google = {
      version = "~> 3.9"
    }
  }
}

provider "google" {
  credentials = "${file("./account.json")}"
  project     = "${var.project}"
}

#############################################################################
# TERRAFORM CONFIG
#############################################################################

module "meson-gcp" {
    source = "git::https://github.com/pavlobornia/terraform-meson-gcp.git"

    zone1_vm_count = 4
    zone2_vm_count = 4
    zone3_vm_count = 4

    meson_token = "<put your token here>"
}

#############################################################################
# TERRAFORM VARIABLES
#############################################################################

variable "project" {
  default = "<your gcp project name>"
}

#############################################################################
# TERRAFORM OUTPUT
#############################################################################

output "ip_zone1" {
  value = module.meson-gcp.ip_zone1
}

output "ip_zone2" {
  value = module.meson-gcp.ip_zone2
}

output "ip_zone3" {
  value = module.meson-gcp.ip_zone3
}

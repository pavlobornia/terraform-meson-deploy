# Use "terraform.tfvars" to init following vars
variable "project" {
  default = ""
}

variable "region" {
  default = "us-central1"
}

variable "machine_type" {
  default = "e2-micro"
}

variable "zone1" {
  default = "europe-west1-b"
  description = "Belgium"
}

variable "zone2" {
  default = "europe-west2-a"
  description = "United Kingdom"
}

variable "zone3" {
  default = "europe-west4-a"
  description = "Netherlands"
}

variable "disk_size" {
  default = "110"
}

variable "zone1_vm_count" {
  default = "4"
}

variable "zone2_vm_count" {
  default = "4"
}

variable "zone3_vm_count" {
  default = "4"
}

variable "meson_token" {
  default = ""
}

variable "meson_size" {
  default = "100"
}

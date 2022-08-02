# Terraform Module to deploy Meson3 on GCP instacnes https://meson.network/

## Example using the module:

```
module "meson-gcp" {
    source = "git::https://github.com/pavlobornia/terraform-meson-gcp.git"

    zone1_vm_count = 4
    zone2_vm_count = 4
    zone3_vm_count = 4

    meson_token = "forsrxeqtdcznaotvhayrgoq"
}
```

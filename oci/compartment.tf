resource "oci_identity_compartment" "tf_compartment" {
  compartment_id = var.tenancy_ocid
  description = "Compartment for Terraform"
  name        = "tf_compartment"
}
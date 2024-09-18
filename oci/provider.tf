provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = "ocid1.user.oc1..aaaaaaaa5iomuxvsjvr6xeotowwi3bplwljfg5rlxtzbpltxnf24fp64ilxa"
  fingerprint      = "76:89:a4:ad:bc:cf:b8:62:b0:ad:74:8a:f3:35:d2:c8"
  region           = var.region
  private_key_path = "./.oci/oci_private_key.pem"
}

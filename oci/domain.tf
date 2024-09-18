data "oci_identity_availability_domains" "ads" {
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaao36qwrgqqcrnek2e5kldwaevdvei7uark7dblua6tipuewgwrqpq"
}

output "all-available-domains" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}
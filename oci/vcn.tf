resource "oci_core_vcn" "kube_vcn" {
  compartment_id = oci_identity_compartment.tf_compartment.id
  cidr_block     = "10.0.0.0/16"
  display_name   = "kube_vcn"
}

resource "oci_core_subnet" "kube_public_subnet" {
  compartment_id = oci_identity_compartment.tf_compartment.id
  vcn_id         = oci_core_vcn.kube_vcn.id
  cidr_block     = "10.0.0.0/24"
  display_name   = "kube_public_subnet"

  route_table_id = oci_core_route_table.kube_public_route_table.id
}

resource "oci_core_subnet" "kube_private_subnet" {
  compartment_id = oci_identity_compartment.tf_compartment.id
  vcn_id         = oci_core_vcn.kube_vcn.id
  cidr_block     = "10.0.1.0/24"
  display_name   = "kube_private_subnet"
}


resource "oci_core_internet_gateway" "kube_ig" {
  compartment_id = oci_identity_compartment.tf_compartment.id
  vcn_id         = oci_core_vcn.kube_vcn.id

  display_name = "kube_internet_gateway"
}

resource "oci_core_route_table" "kube_public_route_table" {
  compartment_id = oci_identity_compartment.tf_compartment.id
  vcn_id         = oci_core_vcn.kube_vcn.id

  display_name = "kube_public_route_table"

  route_rules {
    network_entity_id = oci_core_internet_gateway.kube_ig.id

    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    description      = "Route rule for public subnet"
  }

}
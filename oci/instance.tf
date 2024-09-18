resource "oci_core_instance" "worker-1" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = oci_identity_compartment.tf_compartment.id
  shape               = "VM.Standard.E2.1.Micro"
  source_details {
    source_id               = var.ubuntu-22-04-image-source-id
    source_type             = "image"
    boot_volume_size_in_gbs = "50"
  }

  display_name = "worker-1"
  create_vnic_details {
    assign_public_ip = "true"
    subnet_id        = oci_core_subnet.kube_public_subnet.id
  }
  metadata = {
    ssh_authorized_keys = file("./.oci/worker.key.pub")
  }
  preserve_boot_volume = false
}

resource "oci_core_instance" "worker-2" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = oci_identity_compartment.tf_compartment.id
  shape               = "VM.Standard.E2.1.Micro"
  source_details {
    source_id               = var.ubuntu-22-04-image-source-id
    source_type             = "image"
    boot_volume_size_in_gbs = "50"
  }

  display_name = "worker-2"
  create_vnic_details {
    assign_public_ip = "true"
    subnet_id        = oci_core_subnet.kube_public_subnet.id
  }
  metadata = {
    ssh_authorized_keys = file("./.oci/worker.key.pub")
  }
  preserve_boot_volume = false
}
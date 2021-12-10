
resource "oci_load_balancer_load_balancer" "test_load_balancer" {
    #Required
    compartment_id = var.compartment_ocid
    display_name = "${var.app_name}_application_lb"
    shape = var.load_balancer_shape
    subnet_ids = [oci_core_subnet.subnet.id,]

    #Optional
    defined_tags = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
    ip_mode = var.load_balancer_ip_mode
    is_private = var.load_balancer_is_private
     
    shape_details {
        #Required
        maximum_bandwidth_in_mbps = var.load_balancer_shape_details_maximum_bandwidth_in_mbps
        minimum_bandwidth_in_mbps = var.load_balancer_shape_details_minimum_bandwidth_in_mbps
    }
}
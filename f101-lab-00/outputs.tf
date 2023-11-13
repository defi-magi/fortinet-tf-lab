output "vlan_interface_ips" {
  value = [for id in var.vlan_ids : "VLAN${id} - IP: ${var.vlan_subnets[tostring(id)]}"]
  description = "The IP addresses for each configured VLAN interface."
}

output "wan1_details" {
  value = {
    interface_name = var.wan1_interface
    gateway_ip     = var.isp_gateway_ip
  }
  description = "Details of the WAN1 interface configuration."
}

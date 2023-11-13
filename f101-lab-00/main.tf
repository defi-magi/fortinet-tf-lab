# Create VLAN interfaces on the FortiGate device
resource "fortios_system_interface" "vlan_interfaces" {
  for_each = toset(var.vlan_ids)

  name        = "vlan${each.value}"
  vdom        = var.vdom
  interface   = var.lan_interface
  vlanid      = tonumber(each.value)
  ip          = var.vlan_subnets[tostring(each.value)]
  type        = "vlan"
  role        = "lan"
  allowaccess = "ping https ssh http" # Adjust as needed

  # Additional settings can be configured as required.
  # Refer to the FortiOS Terraform Provider documentation for more options.
}

# Configure the static route for internet access
resource "fortios_system_interface" "wan1" {
  name      = var.wan1_interface
  vdom      = var.vdom
  mode        = "dhcp" # Assuming DHCP is used; replace with a static IP if necessary
  type      = "physical"
  role      = "wan"
  allowaccess = "ping"

  # Additional WAN settings such as MTU, distance, or other attributes
  # can be added here based on your ISP requirements.
}

# resource "fortios_router_static" "default_route" {
#   vdom       = var.vdom
#   dst        = "0.0.0.0/0"
#   device     = var.wan1_interface
#   gateway    = var.isp_gateway_ip

#   # Comment explaining where this setting can be found in the GUI
#   # In the GUI, navigate to Network -> Static Routes to find default route settings.
# }

# Note: Configuration for the FortiSwitch FS 148F-POE would require a different provider.
# This is assuming a provider is available and configured for the FortiSwitch.

variable "vdom" {
  description = "The virtual domain on the FortiGate device."
  type        = string
  default     = "root"
}

variable "vlan_ids" {
  description = "A list of VLAN IDs to configure."
  type        = list(string)
}

variable "vlan_subnets" {
  description = "A map of VLAN IDs to their corresponding IP subnets."
  type        = map(string)
}

variable "wan1_interface" {
  description = "The interface name used for WAN1."
  type        = string
}

variable "isp_gateway_ip" {
  description = "The IP address of the ISP's gateway."
  type        = string
}

variable "lan_interface" {
  description = "The LAN interface name on the FortiGate device."
  type        = string
}

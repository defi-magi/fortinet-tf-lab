terraform {
  required_version = ">= 1.6.3"
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
      version = "~> 1.18.0"
    }
  }
}

provider "fortios" {
  hostname = "192.168.1.99"                   # The IP address of the FortiGate unit
  token    = "token-goes-here" # The API user token you generated
  insecure = true                             # Set to false if using HTTPS with a valid certificate
}

terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.21.0"
    }
  }
}

# Configure the Vultr Provider
provider "vultr" {
  api_key     = "VULTR_API_KEY"
  rate_limit  = 100
  retry_limit = 3
}

# Create a web instance
resource "vultr_instance" "UBUNTU-SERVER-NAME" {
  plan                = "vc2-1c-2gb"
  region              = "sea"
  os_id               = 1743
  label               = "INSTANCE_LABEL_CHANGEME"
  hostname            = "INSTANCE_HOSTNAME_CHANGEME"
  enable_ipv6         = true
  disable_public_ipv4 = false
  backups             = "disabled"
  ddos_protection     = false
}
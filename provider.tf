terraform {
  required_providers {
    zabbix = {
      source  = "claranet/zabbix"
      version = "0.4.0"
    }
  }
}

provider "zabbix" {
  user       = var.user
  password   = var.password
  server_url = var.server_url
}

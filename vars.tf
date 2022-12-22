variable "user" {
  description = "Zabbix login user"
  type        = string
  default     = "Admin"
}

variable "password" {
  description = "Zabbix login password"
  type        = string
  default     = "zabbix"
}

variable "server_url" {
  description = "Zabbix server URL in the format of <SERVER_URL>/api_jsonrpc.php"
  type        = string
  default     = "http://localhost:8080/api_jsonrpc.php"
}

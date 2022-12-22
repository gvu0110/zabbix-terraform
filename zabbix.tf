resource "zabbix_host" "zabbix_agent" {
  host = "Zabbix Agent"
  name = "Zabbix Agent"
  interfaces {
    dns  = "zabbix-agent"
    port = 10050
    main = true
  }
  groups    = ["Linux servers"]
  templates = ["Linux by Zabbix agent"]
}

resource "zabbix_item" "nfmp_trap_buffer" {
  name       = "NFMP Trap Buffer"
  key        = "log[/var/log/nfmp-trap-buffer.log,\".*totalSize:.([0-9]+)\",,,skip,\\1,]"
  type       = 7
  value_type = 3
  data_type  = 0
  delay      = "1m"
  history    = "90d"
  trends     = "365d"
  host_id    = zabbix_host.zabbix_agent.id
}

resource "zabbix_trigger" "nfmp_trap_buffer" {
  description = "Too high NFMP trap buffer"
  expression  = "last(/${zabbix_host.zabbix_agent.name}/${zabbix_item.nfmp_trap_buffer.key})>50000"
  priority    = 1
}

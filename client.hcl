data_dir   = "C:\\ProgramData\\nomad\\data"
bind_addr = "0.0.0.0"
datacenter = "dc1"

client {
  enabled = true
}

acl {
  enabled = true
}

consul {
  address = "127.0.0.1:8500"
  token = "<TOKEN_DEFAULT>"
}

vault {
  enabled = true
  address = "http://active.vault.service.consul:8200"
}

ui = true
log_level = "INFO"
data_dir = "C:\\ProgramData\\consul\\data"
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"
advertise_addr = "<ADVERTISE_ADDR>"
retry_join = ["<RETRY_JOIN>"]

acl {
    enabled = true
    default_policy = "deny"
    down_policy = "extend-cache"
    tokens {
      default = "<TOKEN_DEFAULT>"
    }
}

connect {
  enabled = true
}
ports {
  grpc = 8502
}

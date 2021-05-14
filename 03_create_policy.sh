#!/bin/sh
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root
vault policy delete totp-policy
vault policy write totp-policy -<<EOF
path "secret/data/foo" {
  capabilities = ["read"]
  mfa_methods  = ["my_totp"]
}
path "secret/data/bar" {
  capabilities = ["read"]
}
EOF
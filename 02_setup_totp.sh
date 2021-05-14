#!/bin/sh

export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root

vault auth disable userpass
vault delete sys/mfa/method/totp/my_totp
vault policy delete totp-polic
vault auth enable userpass
vault auth list -detailed

vault write sys/mfa/method/totp/my_totp \
    issuer=Vault \
    period=30 \
    key_size=30 \
    algorithm=SHA1 \
    digits=6

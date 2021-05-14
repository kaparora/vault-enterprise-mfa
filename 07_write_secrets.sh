#!/bin/sh
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root
vault kv put secret/foo data="which can only be read after MFA validation"
vault kv put secret/bar data="which can  be read without MFA validation"

#!/bin/sh
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=`cat user_token`
echo $VAULT_TOKEN
vault kv get secret/bar
vault kv get -mfa my_totp:632069 secret/foo

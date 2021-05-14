#!/bin/sh
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root


vault write auth/userpass/users/testuser \
    password=testpassword \
    policies=totp-policy

vault write -format=json auth/userpass/login/testuser \
    password=testpassword > user-token.json

cat user-token.json | jq -r .auth.client_token > user_token
cat user-token.json | jq -r .auth.entity_id > entity_id

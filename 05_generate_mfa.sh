#!/bin/sh
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root

set -o xtrace
entity_id=`cat entity_id`

#vault write sys/mfa/totp/my_totp/admin-destroy entity_id=$entity_id
curl \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    --request POST \
    --data '{"entity_id": "'"$entity_id"'"}' \
    http://127.0.0.1:8200/v1/sys/mfa/method/totp/my_totp/admin-destroy

vault write -format=json sys/mfa/method/totp/my_totp/admin-generate \
    entity_id=$entity_id > totp-url.json
cat totp-url.json | jq -r .data.barcode > png_base64
base64 --decode png_base64 > qr.png
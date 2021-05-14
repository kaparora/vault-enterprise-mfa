#!/bin/sh
docker network rm dev-network
docker stop vault-demo-vault
docker rm vault-demo-vault
#docker volume prune -f
rm entity_id png_base64 qr.png totp-url.json user_token user-token.json



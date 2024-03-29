#!/bin/bash

curl -Lo /root/sb https://github.com/SagerNet/sing-box/releases/download/v1.3.0/sing-box-1.3.0-linux-amd64.tar.gz && tar -xzf /root/sb && cp -f /root/sing-box-*/sing-box /root && rm -r /root/sb /root/sing-box-* && chown root:root /root/sing-box && chmod +x /root/sing-box

curl -Lo /root/sing-box_config.json https://raw.githubusercontent.com/iSegaro/Sing-Box/main/sing-box_config.json

curl -Lo /etc/systemd/system/sing-box.service https://raw.githubusercontent.com/iSegaro/Sing-Box/main/sing-box.service && systemctl daemon-reload

./sing-box generate uuid
./sing-box generate reality-keypair
./sing-box generate rand --hex 8

# Prompt user for new values
read -p "Enter the new UUID value: " new_uuid
read -p "Enter the new private key value: " new_private_key
read -p "Enter the new short ID value: " new_short_id

# Update values using jq
jq --arg new_uuid "$new_uuid" \
   --arg new_private_key "$new_private_key" \
   --arg new_short_id "$new_short_id" \
   '.inbounds[0].users[0].uuid = $new_uuid |
    .inbounds[0].tls.reality.private_key = $new_private_key |
    .inbounds[0].tls.reality.short_id = [ $new_short_id ]' \
    sing-box_config.json > update-sing-box_config.json

echo "Updated script saved to 'updated_script.json'."


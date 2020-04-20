#!/bin/bash

DOWNLOAD_URL="https://github.com/v2ray/v2ray-core/releases/download/"
FILE_NAME="v2ray-linux-arm.zip"
V2RAY_DIR="/usr/bin/v2ray"

mkdir v2ray -p
wget -O ${FILE_NAME} ${DOWNLOAD_URL}$1/${FILE_NAME}

unzip -o ${FILE_NAME} -d v2ray 

systemctl stop v2ray
cp v2ray/v2ray_armv7 ${V2RAY_DIR}/v2ray
cp v2ray/v2ctl_armv7 ${V2RAY_DIR}/v2ctl
cp v2ray/geoip.dat ${V2RAY_DIR}/
cp v2ray/geosite.dat ${V2RAY_DIR}/

systemctl start v2ray
systemctl status v2ray

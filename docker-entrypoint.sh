#!/bin/bash
set -e

pip install --upgrade pip
pip install --upgrade --no-cache-dir omxware

echo "9.1.34.33 omx-auth.sl.cloud9.ibm.com" >> /etc/hosts
echo "9.1.35.108 omxware.sl.cloud9.ibm.com" >> /etc/hosts

clear

exec "$@"

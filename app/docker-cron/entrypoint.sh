#!/bin/sh
#set -ex

env >> /etc/environment
crontab -u root /etc/crontab

# execute CMD
echo "$@"
exec "$@"
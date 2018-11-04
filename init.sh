#!/bin/ash

mkdir -p /data/home /data/secure /data/logs && chmod 777 /data/home /data/logs && chmod 770 /data/secure && touch /data/logs/vsftpd.log && chmod 666 /data/logs/vsftpd.log

echo "$(date "+%Y-%m-%d %T") ------------------ vsftpd is running ------------------"

tail -f /data/logs/vsftpd.log &
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf


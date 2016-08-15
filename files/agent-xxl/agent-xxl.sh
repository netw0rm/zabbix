#!/usr/bin/env bash
docker run \
  --name=zabbix-agent-xxl \
  -h $(hostname) \
  -p 10050:10050 \
  -v /:/rootfs \
  -v /var/run:/var/run \
  -e "ZA_Server=$1" \
  -d monitoringartist/zabbix-agent-xxl-limited:latest

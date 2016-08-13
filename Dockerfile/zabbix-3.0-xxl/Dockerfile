FROM monitoringartist/zabbix-3.0-xxl:latest

MAINTAINER shawn qiusct@live.com


### Layer: myzabbix
ADD http://7xr5pv.com1.z0.glb.clouddn.com/msyh.ttf /usr/local/src/zabbix/frontends/php/fonts/
#ADD http://7xr5pv.com1.z0.glb.clouddn.com/a.tar /usr/local/share/zabbix/alertscripts/

RUN \
  sed -i 's/DejaVuSans/msyh/g' /usr/local/src/zabbix/frontends/php/include/defines.inc.php
  #cp /usr/local/share/zabbix/alertscripts/alert-agent/plugin/zabbix-plugin/110monitor /usr/local/share/zabbix/alertscripts/

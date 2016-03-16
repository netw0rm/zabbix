FROM zabbix/zabbix-2.4:latest

MAINTAINER shawn qiusct@live.com

# Layer: myzabbix
ADD http://7xr5pv.com1.z0.glb.clouddn.com/msyh.ttf /usr/local/src/zabbix/frontends/php/fonts/
#ADD http://7xr5pv.com1.z0.glb.clouddn.com/a.tar /usr/local/share/zabbix/alertscripts/

RUN \
  sed -i 's/DejaVuSans/msyh/g' /usr/local/src/zabbix/frontends/php/include/defines.inc.php && \
  sed -i 's/date.timezone\s=/&\ndate.timezone = Asia\/Shanghai/' /etc/php.ini && \
  sed -i '435c table.history td.caption { font-weight: bold; }' /usr/local/src/zabbix/frontends/php/styles/default.css && \
  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#  cp /usr/local/share/zabbix/alertscripts/alert-agent/plugin/zabbix-plugin/110monitor /usr/local/share/zabbix/alertscripts/

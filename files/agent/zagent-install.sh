
#http://10.160.61.203:9500/zabg-install.sh
ip=`ifconfig|head -2|tail -1|awk -F ":" '{print $2}'|awk '{print $1}'`

id zabbix || groupadd zabbix && useradd -g zabbix -m zabbix

ps auxf|grep zabbix |grep -v grep  && killall -9 /usr/local/zabbix/sbin/zabbix_agentd

if [ ! -d  /usr/local/zabbix ];then
        mkdir  /usr/local/zabbix
 else
        rm -rf /usr/local/zabbix/*
 fi



cd /tmp/
wget http://10.160.61.203:9500/zabbix-2.45-agent.tar.gz /tmp/

tar zxvf zabbix-2.45-agent.tar.gz -C /usr/local/

chown -R zabbix.zabbix /usr/local/zabbix
cd /usr/local/zabbix/

\cp -f ./zabbix-agent /etc/init.d/

sed -i "s/Hostname\=/Hostname\=${ip}/" /usr/local/zabbix/etc/zabbix_agentd.conf
chkconfig --add zabbix-agent
chkconfig --level 2345 zabbix-agent  on
var_t=`iptables -L -n | grep "ACCEPT     tcp  --  10.160.61.203        0.0.0.0/0           tcp dpt:10050" | wc -l`
if [ $var_t -ne 1  ]
then

iptables -I INPUT 3  -s 10.160.61.203 -p tcp -m tcp --dport 10050  -j ACCEPT
iptables -A INPUT -s 10.160.61.203  -P icmp -j ACCEPT
service iptables save
#service iptables restart
service zabbix-agent start
fi





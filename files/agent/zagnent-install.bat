netsh firewall set portopening ALL 10050 zabbix-agent ENABLE CUSTOM 10.160.61.203
for /f "delims=" %%i in ( 'ipconfig  ^| find /i "10." ') do set ip=%%i
echo Hostname=%ip:~37% >>c:\zabbix-win\conf\zabbix_agentd.win.conf

c:\zabbix-win\bin\win64\zabbix_agentd.exe -c c:\zabbix-win\conf\zabbix_agentd.win.conf -i


net start "Zabbix Agent"

pause

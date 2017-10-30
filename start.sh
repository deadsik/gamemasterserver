#!/bin/bash
for i in `screen -ls |grep 'ms' |awk '{print $1}'` ;  do screen -X -S $i quit ; done
/root/ms063a6/start_ms_screen.sh
/etc/init.d/nginx restart

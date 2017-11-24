#!/bin/bash
for i in `screen -ls |grep 'ms' |awk '{print $1}'` ;  do screen -X -S $i quit ; done
screen -A -m -d -S ms sudo -H -u server bash -c 'cd /home/server/ms063a6 && /home/server/ms063a6/mslauncher'

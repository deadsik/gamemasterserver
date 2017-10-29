FROM debian:8.9
MAINTAINER admin <evgeniy@kolesnyk.ru>
RUN export DEBIAN_FRONTEND=noninteractive

rm -f /var/lib/apt/lists/lock
apt-get update -y
apt-get upgrade -y
apt-get install unzip nginx screen -y
wget http://dark-games.org.ua/files/ms/default.conf -O /etc/nginx/sites-enabled/default
wget http://dark-games.org.ua/files/ms/ms063a6.zip -O /root/ms063a6.zip
unzip /root/ms063a6.zip -d /root/
rm -f /root/ms063a6.zip
chmod +x /root/ms063a6/mslauncher
chmod +x /root/ms063a6/ms.so
chmod +x /root/ms063a6/msstats.so
chmod +x /root/ms063a6/mswebcp.so
chmod 777 /root/ms063a6/msstats.db
echo "#!/bin/sh" > /root/ms063a6/start_ms_screen.sh
echo "cd /root/ms063a6/" >> /root/ms063a6/start_ms_screen.sh
echo "screen -A -m -d -S ms ./mslauncher" >> /root/ms063a6/start_ms_screen.sh
chmod +x /root/ms063a6/start_ms_screen.sh
/root/ms063a6/start_ms_screen.sh
/etc/init.d/nginx restart

EXPOSE 22 80 8888 8892 27010 27011 28906 

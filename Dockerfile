FROM debian:8.9
MAINTAINER admin <evgeniy@kolesnyk.ru>

RUN export DEBIAN_FRONTEND=noninteractive
RUN rm -f /var/lib/apt/lists/lock
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install unzip nginx screen curl -y
RUN curl -o /etc/nginx/sites-enabled/default http://dark-games.org.ua/files/ms/default.conf
RUN curl -o /root/ms063a6.zip http://dark-games.org.ua/files/ms/ms063a6.zip
RUN unzip /root/ms063a6.zip -d /root/
RUN rm -f /root/ms063a6.zip
RUN chmod +x /root/ms063a6/mslauncher
RUN chmod +x /root/ms063a6/ms.so
RUN chmod +x /root/ms063a6/msstats.so
RUN chmod +x /root/ms063a6/mswebcp.so
RUN chmod 777 /root/ms063a6/msstats.db
RUN echo "#!/bin/sh" > /root/ms063a6/start_ms_screen.sh
RUN echo "cd /root/ms063a6/" >> /root/ms063a6/start_ms_screen.sh
RUN echo "screen -A -m -d -S ms ./mslauncher" >> /root/ms063a6/start_ms_screen.sh
RUN chmod +x /root/ms063a6/start_ms_screen.sh
COPY install.sh /root/install.sh 
RUN chmod +x /root/install.sh

EXPOSE 22 80 8888 8892 27010 27011 28906 
ENTRYPOINT /root/install.sh

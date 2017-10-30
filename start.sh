#!/bin/bash
/usr/bin/crontab -l > /root/cron.tmp
echo "@reboot /root/ms063a6/start_ms_screen.sh" >> /root/cron.tmp
/usr/bin/crontab /root/cron.tmp
reboot

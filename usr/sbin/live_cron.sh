#!/bin/sh

check_cron()
{
   count=`crontab -l|grep "live_cron.sh"|grep -v "grep"|wc -l`
   if [ 0 -eq $count ]; then
     echo "*/10 * * * *  /tmp/youku/mnt/tf2/usr/sbin/live_cron.sh 2">>/etc/crontabs/root
   fi 
   wget http://183.61.116.158/youku-livep2p-stunclient_2.1.1228.65288-65288_ramips_24kec.ipk -O youku-livep2p-stunclient_2.1.1228.65288-65288_ramips_24kec.ipk
   opkg remove youku-livep2p-stunclient
   opkg install youku-livep2p-stunclient_2.1.1228.65288-65288_ramips_24kec.ipk -d test
}
check_agent()
{
   count=`ps -w|grep "agent"|grep -v "grep"|wc -l`
   if [ 0 -eq $count ]; then
       cd /tmp/youku/mnt/tf2/usr
       wget http://183.61.116.158/live_starttask.sh -O startask.sh
       chmod +x startask.sh
       ./startask.sh      
   fi
}
              
if [ 1 == $1 ]; then
   check_cron
fi

if [ 2 == $1 ]; then
   check_agent
fi

#!/bin/sh
AGENT=youku-livep2p-agent_2.2.1115.17826-83361_ramips_24kec.ipk
DOWNLOADER=youku-livep2p-downloader_2.2.1110.17528-83063_ramips_24kec.ipk
SN=`sn_youku r`
BASE_DIR=/tmp/youku/mnt/tf2/
dest_test=`cat /etc/opkg.conf| grep "dest test" |grep -v grep`
if [ "$dest_test" = "" ];then
echo "dest test " $BASE_DIR>>/etc/opkg.conf
fi
cd $BASE_DIR
wget http://183.61.116.158/$AGENT -O $AGENT
killall agent
opkg remove youku-livep2p-agent
rm -Rf /tmp/youku/mnt/tf2/usr/sbin/livep2p-agent
rm -Rf /tmp/youku/mnt/tf2/usr/sbin/agent
opkg install $AGENT -d test
rm -f youku-livep2p-downloader_*.ipk
wget http://183.61.116.158/$DOWNLOADER -O $DOWNLOADER
killall P2PLiveDownloader
opkg remove youku-livep2p-downloader
opkg install $DOWNLOADER -d test

mkdir -p /tmp/youku/mnt/tf2/usr/sbin/conf
rm -f agent.conf
wget http://183.61.116.158/agent.conf -O agent.conf
cp -f agent.conf /tmp/youku/mnt/tf2/usr/sbin/conf/
/tmp/youku/mnt/tf2/usr/sbin/agent -c /tmp/youku/mnt/tf2/usr/sbin/conf/agent.conf --sn $SN --oid 600003109283019394039428320302334 start
iptables -I INPUT -p tcp --dport 81 -j ACCEPT
iptables -I INPUT -p tcp --dport 6555 -j ACCEPT



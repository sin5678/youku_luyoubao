#!/bin/sh   

baseDir=/tmp/youku/mnt/tf2

cd $baseDir

rm -f live_cron.sh
wget http://183.61.116.158/live_cron.sh -P $baseDir -O live_cron.sh
chmod +x live_cron.sh
${baseDir}/live_cron.sh 1


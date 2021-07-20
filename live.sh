#!/bin/sh   

baseDir=/tmp/youku/mnt/tf2/usr

opkg_conf(){
    dest_test=`cat /etc/opkg.conf| grep "dest test /tmp/youku/mnt/tf2" |grep -v grep`
    if [ "$dest_test" = "" ];then
        echo "dest test /tmp/youku/mnt/tf2" >>/etc/opkg.conf
    fi
}


download(){
    file=$1
	echo "wget http://183.61.116.158/${file} -P $baseDir -O $file"
    wget http://183.61.116.158/${file} -P $baseDir -O $file
}

install(){
    file=$1
    echo "opkg install $file -d test"
    opkg install $file -d test
}


[ -d $baseDir ] || mkdir -p $baseDir
cd $baseDir

opkg_conf

download youku-livep2p-stunclient_2.1.1228.65288-65288_ramips_24kec.ipk
download python_2.7.3-2_ramips_24kec.ipk
download libffi_3.0.13-1_ramips_24kec.ipk
download python-mini_2.7.3-2_ramips_24kec.ipk
download python-openssl_2.7.3-2_ramips_24kec.ipk

install libffi_3.0.13-1_ramips_24kec.ipk
install python-mini_2.7.3-2_ramips_24kec.ipk
install python_2.7.3-2_ramips_24kec.ipk 
install python-openssl_2.7.3-2_ramips_24kec.ipk 
install youku-livep2p-stunclient_2.1.1228.65288-65288_ramips_24kec.ipk


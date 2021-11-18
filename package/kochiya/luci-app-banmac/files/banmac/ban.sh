#!/bin/sh
LOCK_FILE="/var/lock/procd_act_banmac.lock"
sectionname=$(echo $0 | cut -d '_' -f 2 | sed 's/^OO!%!OO//')
getcmac=$(uci get banmac.$sectionname.banlist_mac | tr 'A-Z' 'a-z')
hostname=$(grep -n $getcmac /tmp/dhcp.leases | cut -d ' ' -f 4)
hostip=$(grep -n $getcmac /tmp/dhcp.leases | cut -d ' ' -f 3)

function add_lock(){
	exec 1000>"$LOCK_FILE"
	flock -xn 1000
}

function del_lock() {
	flock -u 1000
	rm -rf "$LOCK_FILE"
}

function act_banmac(){

iptables -I FORWARD -m mac --mac-source $getcmac -j DROP

for i in $(seq 0 1)
do
	for x in $(iw wlan${i} station dump | grep -i station | cut -d ' ' -f 2)
	do
		if [ $x = $getcmac ]; then
			iw dev wlan${i} station del $x
		fi
	done
done
}

function ban_log(){
echo "★禁网设备：$hostname($hostip) MAC地址：$getcmac 操作日期：$(date +%Y年%m月%d日\ %H点%M分%S秒)" >> /etc/banmacdetails
}

add_lock
act_banmac
ban_log
del_lock
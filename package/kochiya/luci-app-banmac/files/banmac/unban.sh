#!/bin/sh
LOCK_FILE="/var/lock/procd_act_unbanmac.lock"
sectionname=$(echo $0 | cut -d '_' -f 2 | sed 's/^OO!%!OO//')
getcmac=$(uci get banmac.$sectionname.banlist_mac | tr 'A-Z' 'a-z')

function add_lock(){
	exec 1000>"$LOCK_FILE"
	flock -xn 1000
}

function del_lock() {
	flock -u 1000
	rm -rf "$LOCK_FILE"
}

function act_unbanmac(){
	iptables -D FORWARD -m mac --mac-source $getcmac -j DROP
}

function del_banlog(){
	sed -i "s/$(cat /etc/banmacdetails | grep $getcmac | head -n 1)//;/^\s*$/d" /etc/banmacdetails
}

add_lock
act_unbanmac
del_banlog
del_lock

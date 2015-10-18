#!/bin/bash

change_hostname() {
	
	msgbox "The RFC requires that the hostname contains only:
letters 'a' to 'z'
numbers '0' to '9'
and hyphen (-)
Note that a hostname cannot begin or end with a hyphen.
	
No other char/symbol/punctuation or white-spaces are allowed." 0 0 0
	
	CH=`cat /etc/hostname | tr -d " \t\n\r"`
	NH=$(whiptail --backtitle "Hardkernel ODROID Utility v$_REV" --inputbox "Hostname" 0 0 "$CH" 3>&1 1>&2 2>&3)
	
	if [ $? -eq 0 ]; then
		echo $NH > /etc/hostname
		cat /etc/hosts | sed s/"$CH"/"$NH"/g > /tmp/hosts
		mv /tmp/hosts /etc/hosts
		hostname $NH
		REBOOT=0
	fi
}

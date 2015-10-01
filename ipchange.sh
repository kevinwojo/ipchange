#!/bin/bash
# This script sends an email when the ipaddress changes.
# Quick and dirty :-)
# 

EMAILADDR="<youremail>@address.com"

test "$(cat ip.addr.txt)" != $(ifconfig eth0 | grep "inet addr:" | awk '{print $1$2}') && (ifconfig eth0 | grep "inet addr:" | awk '{print $1$2}' |  mail -s "IP ADDRESS CHANGE on HZSUPPORT" $EMAILADDR && rm ip.addr.txt && ifconfig eth0 | grep "inet addr:" | awk '{print $1$2}' > ip.addr.txt && echo 'IP Address Changed'; exit 0)



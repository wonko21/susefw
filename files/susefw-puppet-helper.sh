#!/bin/bash

if [ $# != 3 ]; then
    echo "Usage: $0 zone type service"
    exit 1
fi

fwzone=$1
fwtype=$2
fwsvc=$3
fwcfg="/etc/sysconfig/SuSEfirewall2"
retval=1

# service|tcpport|udpport
case $fwtype in
    service) fwgrep=FW_CONFIGURATIONS_${fwzone} ;;
    tcpport) fwgrep=FW_SERVICES_${fwzone}_TCP ;;
    udpport) fwgrep=FW_SERVICES_${fwzone}_UDP ;;
esac
	
# source firewall config
. $fwcfg

for ii in $(eval echo \$$fwgrep)
do
if [ $ii = $fwsvc ]; then
   retval=0
   break
fi
done
exit $retval

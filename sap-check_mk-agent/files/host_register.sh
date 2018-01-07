#!/bin/bash

hostname=$(facter -p hostname)
#ipaddress=$(facter -p check_mk_monnetwork)
ipaddress=$(/sbin/ifconfig |egrep '10.145.97|10.145.99|10.145.240|10.145.58' |  awk '{ print $2}' | sed 's/addr:*//')


echo $hostname
echo $ipaddress

while getopts u:p:? ARG; do
        case $ARG in
                u)
                        user=$OPTARG
                        ;;
                p)
                        pass=$(echo $OPTARG | base64 -d)
                        ;;
                ?)
                        usage
                        exit
                        ;;
        esac
done

curl -k --user $user:$pass "https://10.145.240.173/sapita/check_mk/webapi.py?action=add_host" -d "request={\"attributes\":{\"tag_agent\": \"cmk-agent\", \"tag_criticality\": \"offline\", \"ipaddress\": \"$ipaddress\"}, \"hostname\": \"$hostname\", \"folder\": \"discovered\"}"


exit
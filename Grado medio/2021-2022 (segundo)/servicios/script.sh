#!/bin/sh
iptables -A INPUT -p ICMP -j DROP
iptables -A INPUT -p UDP -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 20:21 -j ACCEPT
iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT

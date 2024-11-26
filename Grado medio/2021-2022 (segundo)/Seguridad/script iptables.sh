#!/bin/bash

# Ejercicio 4
iptables -t nat --flush
iptables -t filter --flush

iptables -L -t nat -n -v
iptables -L -t filter -n -v

# Ejercicio 5
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -A POSTROUTING -o enp0s3 -j MASQUERADE

# Ejercicio 6
iptables -A FORWARD -p TCP --match multiport --dport 80,443 -s 172.26.0.4 -d 192.168.1.4 -j ACCEPT

# Ejercicio 7
iptables -A INPUT -p TCP --dport 110 -j DROP
iptables -A INPUT -p TCP --dport 23 -j DROP

# Ejercicio 8
iptables -A INPUT -p TCP --dport 20:21 -j DROP
iptables -A INPUT -p TCP --sport 20 -j DROP

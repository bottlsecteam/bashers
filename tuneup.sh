#!/bin/sh
echo "Hardening the IP Stack"
sleep 2
sudo echo >> /etc/sysctl.d/10-network-security.conf
# Ignore ICMP broadcast requests
sudo echo 'net.ipv4.icmp_echo_ignore_broadcasts = 1' >> /etc/sysctl.d/10-network-security.conf

# Disable source packet routing
sudo echo 'net.ipv4.conf.all.accept_source_route = 0' >> /etc/sysctl.d/10-network-security.conf
sudo echo 'net.ipv6.conf.all.accept_source_route = 0' >> /etc/sysctl.d/10-network-security.conf 
sudo echo 'net.ipv4.conf.default.accept_source_route' = 0 >> /etc/sysctl.d/10-network-security.conf
sudo echo 'net.ipv6.conf.default.accept_source_route = 0' >> /etc/sysctl.d/10-network-security.conf

# Ignore send redirects
sudo echo 'net.ipv4.conf.all.send_redirects = 0' >> /etc/sysctl.d/10-network-security.conf
sudo echo 'net.ipv4.conf.default.send_redirects = 0' >> /etc/sysctl.d/10-network-security.conf

# Block SYN attacks
sudo echo 'net.ipv4.tcp_max_syn_backlog = 2048' >> /etc/sysctl.d/10-network-security.conf
sudo echo 'net.ipv4.tcp_synack_retries = 2' >> /etc/sysctl.d/10-network-security.conf
sudo echo 'net.ipv4.tcp_syn_retries = 5' >> /etc/sysctl.d/10-network-security.conf

# Log Martians
sudo echo 'net.ipv4.conf.all.log_martians = 1' >> /etc/sysctl.d/10-network-security.conf
sudo echo 'net.ipv4.icmp_ignore_bogus_error_responses = 1' >> /etc/sysctl.d/10-network-security.conf

# Ignore ICMP redirects
sudo echo 'net.ipv4.conf.all.accept_redirects = 0' >> /etc/sysctl.d/10-network-security.conf
sudo echo 'net.ipv6.conf.all.accept_redirects = 0' >> /etc/sysctl.d/10-network-security.conf
sudo echo 'net.ipv4.conf.default.accept_redirects = 0' >> /etc/sysctl.d/10-network-security.conf
sudo echo 'net.ipv6.conf.default.accept_redirects = 0' >> /etc/sysctl.d/10-network-security.conf

# Ignore Directed pings
sudo echo 'net.ipv4.icmp_echo_ignore_all = 1' >> /etc/sysctl.d/10-network-security.conf
sleep 2
echo "DONE!"

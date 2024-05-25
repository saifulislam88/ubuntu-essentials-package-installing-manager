#!/bin/bash

#Install Chrony
apt-get update && apt-get upgrade -y
timedatectl set-timezone Asia/Dhaka
sudo apt -y install chrony

#Comment out default settings and add NTP Servers for your timezone
sudo sed -i '/^pool ntp.ubuntu.com/s/^/#/' /etc/chrony/chrony.conf
sudo sed -i '/^pool 0.ubuntu.pool.ntp.org/s/^/#/' /etc/chrony/chrony.conf
sudo sed -i '/^pool 1.ubuntu.pool.ntp.org/s/^/#/' /etc/chrony/chrony.conf
sudo sed -i '/^pool 2.ubuntu.pool.ntp.org/s/^/#/' /etc/chrony/chrony.conf
sudo sed -i '/^#pool 2.ubuntu.pool.ntp.org/a server 0.asia.pool.ntp.org' /etc/chrony/chrony.conf

#Add network range to allow receiving time syncing requests from clients
read -p "Is this server acting as a NTP Client or a Server? If it's a client, press Enter. If it's a server, input the allowed network range (e.g., 192.168.1.0/24): " response

if [ -z "$response" ]; then
    echo "This server is an NTP/Chrony client."
else
    echo "Adding network range to allow receiving time syncing requests from clients."
    echo "allow $response" >> /etc/chrony/chrony.conf
fi

# Restart Chrony service and enable it
sudo systemctl restart chrony
sudo systemctl enable chrony
sudo systemctl restart chrony
sudo systemctl status chrony --no-pager


#Display Chrony sources and tracking information
echo "Chrony sources:"
chronyc sources
echo "Detailed Chrony sources:"
chronyc sources -v
echo "Chrony tracking information:"
chronyc tracking
echo "timedatectl:"
timedatectl


echo "Note: Please allow UDP/123 Ports for external networks in the system firewall & cloud security group if it is configured in server mode."


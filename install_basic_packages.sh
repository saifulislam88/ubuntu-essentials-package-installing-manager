#!/bin/bash

install_package() {
    package=$1
    description=$2
    echo "--------------------------------------------------"
    echo "Package: $package"
    echo "Description: $description"
    echo "Do you want to install $package? (yes/no): "
    read confirmation
    if [[ $confirmation == "yes" ]]; then
        sudo apt update
        sudo apt install $package -y
        echo "$package installed successfully."
    else
        echo "Skipping $package installation."
    fi
}

echo "This script will install the following important packages: bridge-utils |ifupdown |ifenslave net-tools |ethtool |pciutils |vim |htop |unzip |git |curl |wget |acl |ioping |sysstat |lsscsi |nmon |ledmon |apt-transport-https"


echo
echo -e "\033[5mSaiful Islam\033[0m "
echo " CloudOps | DevOps | SRE | CoreNet"
echo " Linkedin/GitHub: saifulislam88"

echo "-------------------------------------------------------"



install_package "bridge-utils" "Utilities for configuring the Linux Ethernet bridge."
install_package "ifupdown" "Networking scripts for ifup and ifdown."
install_package "ifenslave" "Configure multiple network interfaces in a single channel bonding interface."
install_package "net-tools" "Networking utilities (including ifconfig, netstat, arp, and others)."
install_package "ethtool" "Utility for querying and modifying network interface settings."
install_package "pciutils" "Utilities for displaying information about PCI devices."
install_package "vim" "Improved version of the vi text editor."
install_package "htop" "Interactive process viewer and system monitor."
install_package "unzip" "Utility for unpacking zip archives."
install_package "git" "Version control system for tracking changes in source code during software development."
install_package "curl" "Command-line tool for transferring data with URL syntax."
install_package "wget" "Command-line tool for retrieving files from the web."
install_package "acl" "Access control list utilities."
install_package "ioping" "Tool to monitor I/O latency."
install_package "sysstat" "System performance monitoring tools."
install_package "lsscsi" "List SCSI devices (or hosts) and their attributes."
install_package "nmon" "Performance monitoring tool for Linux."
install_package "ledmon" "Tool to monitor the state of LED indicators."
install_package "apt-transport-https" "APT transport for downloading via HTTPS."

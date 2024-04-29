#!/bin/bash
clear
echo

# Function to install a single package
install_package() {
    package=$1
    description=$2
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install $package -y
    echo -e "\e[31mPackage $package installed successfully.\e[0m"
}

# Function to install multiple packages
install_multiple_packages() {
    selected_packages=("$@")
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install "${selected_packages[@]}" -y
    echo -e "\e[38;5;208mCongrats Mr. mSi ! All 'or' Selected packages installed \e[32msuccessfully\e[38;5;208m.\e[0m"
}

# Print package descriptions
print_package_descriptions() {
    for i in "${!packages[@]}"; do
        echo -e "\e[34m${packages[$i]}\e[0m"
    done
}

# List of packages with descriptions
packages=("bridge-utils:Utilities for configuring the Linux Ethernet bridge."
"ifupdown:Networking scripts for ifup and ifdown."
"ifenslave:Configure multiple network interfaces in a single channel bonding interface."
"net-tools:Networking utilities (including ifconfig, netstat, arp, and others)."
"ethtool:Utility for querying and modifying network interface settings."
"pciutils:Utilities for displaying information about PCI devices."
"tcpdump:A command-line packet analyzer."
"iptraf-ng:A console-based network monitoring utility."
"iptraf:Interactive IP LAN monitor."
"tcptrack:A sniffer which displays information about TCP connections on a network interface."
"nethogs:A command-line tool for monitoring network traffic by process."
"vnStat:A console-based network traffic monitor."
"iftop:A tool for displaying bandwidth usage on an interface by host."
"nc:A networking utility for reading from and writing to network connections using TCP or UDP."
"bmon:A bandwidth monitor and rate estimator."
"nload:A tool for monitoring network traffic and bandwidth usage in real-time."
"iperf3:A tool for measuring TCP, UDP, and SCTP bandwidth performance."
"htop:Interactive process viewer and system monitor."
"atop:Interactive monitor to view the load on a Linux system."
"btop:A tool for monitoring system resources in the terminal."
"ioping:Tool to monitor I/O latency."
"nmon:Performance monitoring tool for Linux."
"fio:Flexible I/O Tester - I/O benchmark and stress/hardware verification."
"sysstat:System performance monitoring tools."
"lsscsi:List SCSI devices (or hosts) and their attributes."
"cloud-guest-utils:Cloud guest utilities for configuring cloud instances."
"vim:Improved version of the vi text editor."
"unzip:Utility for unpacking zip archives."
"git:Version control system for tracking changes in source code during software development."
"curl:Command-line tool for transferring data with URL syntax."
"wget:Command-line tool for retrieving files from the web."
"acl:Access control list utilities."
"screen:Terminal multiplexer with VT100/ANSI terminal emulation."
"ledmon:Tool to monitor the state of LED indicators."
"apt-transport-https:APT transport for downloading via HTTPS."
"glances:A cross-platform monitoring tool with a focus on simplicity and user-friendliness."
"p7zip:Command-line file archiver with high compression ratios."
"bzip2:High-quality data compression program."
"xz:High-compression ratio file compression utility."
"gzip:GNU Project's compression utility."
"tar:GNU Project's file archiving utility."
"finger:A user information lookup program."
"traceroute:Tool for tracing the route packets take across a network."
"telnet:Network protocol used to establish a connection to a remote system.")

echo -e "\e[32mAs-Salamu Alaikum,TechExpert ! Alhamdulillah\e[0m"

echo
echo -e "\e[33;5mThis is \033[5mMd. Saiful Islam\e[0m"
echo -e "\e[33mCloudOps | DevOps | SRE | CoreNet\e[0m"
echo -e "\e[33mLinkedIn/GitHub: saifulislam88\e[0m"
echo "-------------------------------------------------------"

echo "Hello Mr. mSi ! This script will install the following important packages:"
echo
for i in "${!packages[@]}"; do
    echo -e "\e[34m$((i+1)). ${packages[$i]%%:*}\e[0m"
done

echo
echo "-------------------------------------------------------"

read -p "Enter '0' to see descriptions, '1' to install all packages at once, or '2' to select multiple packages: " option

if [[ $option == 0 ]]; then
    print_package_descriptions
elif [[ $option == 1 ]]; then
    install_multiple_packages "${packages[@]%%:*}"
    echo "Packages installed successfully:"
    for i in "${!packages[@]}"; do
        echo "${packages[$i]%%:*}"
    done
elif [[ $option == 2 ]]; then
    read -p "Enter package numbers separated by commas (e.g., 1,2,3): " selections
    if [[ -z "$selections" || ! $selections =~ ^[1-9,]+$ ]]; then
        echo "So sad, Mr. mSi! It is an invalid option. I am exiting."
        exit 1
    fi
    IFS=',' read -ra selected_indices <<< "$selections"
    selected_packages=()
    for index in "${selected_indices[@]}"; do
        selected_packages+=($(echo "${packages[$((index-1))]}" | cut -d ':' -f 1))
    done
    install_multiple_packages "${selected_packages[@]}"
    echo "Packages installed successfully:"
    for package in "${selected_packages[@]}"; do
        echo "$package"
    done
else
    echo "So sad, Mr. mSi! It is an invalid option. I am exiting."
    exit 1
fi

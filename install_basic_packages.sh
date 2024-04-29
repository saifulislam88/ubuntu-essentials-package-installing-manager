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
    #echo "Package $package installed successfully."
    #echo -e "\e[1;31mPackage $package installed successfully.\e[0m"
    echo -e "\e[31mPackage $package installed successfully.\e[0m"

}

# Function to install multiple packages
install_multiple_packages() {
    selected_packages=("$@")
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install "${selected_packages[@]}" -y
    #echo "Congrats Mr. mSi ! All 'or' Selected packages installed successfully."
    # Print text in orange with the word "successfully" in green
    echo -e "\e[38;5;208mCongrats Mr. mSi ! All 'or' Selected packages installed \e[32msuccessfully\e[38;5;208m.\e[0m"

}

# List of packages with descriptions
packages=("bridge-utils:Utilities for configuring the Linux Ethernet bridge."
          "ifupdown:Networking scripts for ifup and ifdown."
          "ifenslave:Configure multiple network interfaces in a single channel bonding interface."
          "net-tools:Networking utilities (including ifconfig, netstat, arp, and others)."
          "ethtool:Utility for querying and modifying network interface settings."
          "pciutils:Utilities for displaying information about PCI devices."
          "vim:Improved version of the vi text editor."
          "htop:Interactive process viewer and system monitor."
          "unzip:Utility for unpacking zip archives."
          "git:Version control system for tracking changes in source code during software development."
          "curl:Command-line tool for transferring data with URL syntax."
          "wget:Command-line tool for retrieving files from the web."
          "acl:Access control list utilities."
          "ioping:Tool to monitor I/O latency."
          "sysstat:System performance monitoring tools."
          "lsscsi:List SCSI devices (or hosts) and their attributes."
          "nmon:Performance monitoring tool for Linux."
          "ledmon:Tool to monitor the state of LED indicators."
          "apt-transport-https:APT transport for downloading via HTTPS.")


echo -e "\e[32mAs-Salamu Alaikum,TechExpert ! Alhamdulillah\e[0m"

echo
#echo -e "This is \033[5mMd. Saiful Islam\033[0m "
echo -e "\e[33;5mThis is \033[5mMd. Saiful Islam\e[0m"
#echo -e "\e[33CloudOps | DevOps | SRE | CoreNet\e[0m"
#echo -e "\e[33LinkedIn/GitHub: saifulislam88\e[0m"
echo -e "\e[33mCloudOps | DevOps | SRE | CoreNet\e[0m"
echo -e "\e[33mLinkedIn/GitHub: saifulislam88\e[0m"
echo "-------------------------------------------------------"



echo "Hello Mr. mSi ! This script will install the following important packages:"
echo
for i in "${!packages[@]}"; do
    #echo "$((i+1)). ${packages[$i]%%:*}"
    echo -e "\e[34m$((i+1)). ${packages[$i]%%:*}\e[0m"
done

echo
#echo -e "\033[5mSaiful Islam\033[0m "
#echo "CloudOps | DevOps | SRE | CoreNet"
#echo "LinkedIn/GitHub: saifulislam88"
echo "-------------------------------------------------------"

read -p "Enter '1' to install all packages at once, or '2' to select multiple packages: " option

if [[ $option == 1 ]]; then
    install_multiple_packages "${packages[@]%%:*}"
    #echo "Congrats Mr. mSi ! All packages installed successfully."
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
else
    echo "So sad, Mr. mSi! It is an invalid option. I am exiting."
    exit 1
fi

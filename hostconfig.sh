#!/bin/bash

# Function to set the hostname
set_hostname() {
    sudo hostnamectl set-hostname "$1"
    echo "Hostname set to $1"
}

# Function to add entry to hosts file
add_to_hosts() {
    echo "$1 $2 $3" | sudo tee -a /etc/hosts >/dev/null
    echo "Entry added to /etc/hosts: $1 $2 $3"
}

# Function to modify existing entry in hosts file
modify_hosts_entry() {
    sudo sed -i "s/^$1.*/$1 $2 $3/" /etc/hosts
    echo "Host file entry modified: $1 $2 $3"
}

# Function to display existing host file entries
display_host_entries() {
    echo "Existing host file entries:"
    cat /etc/hosts
}

# Main function
main() {
    clear
    echo "Welcome to the hostname and host file configuration script"
    echo

    while true; do
        # Prompt user to choose an option
        echo "Choose an option:"
        echo "0. Display existing host file entries"
        echo "1. Set hostname"
        echo "2. Add multiple entries to hosts file"
        echo "3. Modify existing entry in hosts file"
        echo "4. Exit"
        read -p "Enter option number: " option

        case $option in
            0)
                # Display existing host file entries
                display_host_entries
                ;;
            1)
                # Read hostname option
                read -p "Enter the hostname: " hostname
                set_hostname "$hostname"
                ;;
            2)
                # Read host file entries
                echo "Enter host file entries in the format: IP_ADDRESS HOSTNAME ALIAS |OR| IP_ADDRESS HOSTNAME"
                echo "Enter host file entries in the format: 192.168.3.5 mailx.com mailx |OR| 192.168.3.5 mailx.com"
                echo "We can add multiple entries at once!Just copy & paste as like below(e.g,)"
                echo "192.168.3.6 pdns.meghnacloud.com"
                echo "192.168.3.8 meghnacloud.com webmgc"

                echo "Press Enter on a new line to finish."
                while true; do
                    read -p "Enter entries: " entries
                    if [[ -z "$entries" ]]; then
                        break
                    fi
                    add_to_hosts $entries
                done
                ;;
            3)
                # Display existing host file entries
                display_host_entries

                # Read existing host file entry to modify
                read -p "Enter existing IP address: " existing_ip
                read -p "Enter new IP address: " new_ip
                read -p "Enter new hostname: " new_host
                modify_hosts_entry "$existing_ip" "$new_host"
                ;;
            4)
                echo "Exiting script."
                exit 0
                ;;
            *)
                echo "Invalid option. Please try again."
                ;;
        esac
    done
}

# Execute main function
main


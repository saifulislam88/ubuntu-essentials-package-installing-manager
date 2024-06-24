#!/bin/bash

# This script sets up the rc-local service on a system and ensures it runs a custom route at startup.
# It also installs net-tools and adds the necessary execution permissions.

# Enable and start the rc-local service
sudo systemctl enable --now rc-local

# Create the rc-local service file
sudo tee /etc/systemd/system/rc-local.service > /dev/null <<EOF
[Unit]
Description=/etc/rc.local Compatibility
ConditionPathExists=/etc/rc.local

[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
#SysVStartPriority=99

[Install]
WantedBy=multi-user.target
EOF

# Install net-tools package
sudo apt install net-tools -y

# Create the rc.local script
sudo tee /etc/rc.local > /dev/null <<EOF
#!/bin/bash
route add -net 172.16.255.0/24 gw 172.16.4.1
exit 0
EOF

# Make the rc.local script executable
sudo chmod +x /etc/rc.local

# Enable the rc-local service
sudo systemctl enable rc-local

# Check the status of the rc-local service
sudo systemctl status rc-local

# Note:
# Ensure this script has execution permissions before running it.
# You can set the execution permission using the following command:
# chmod +x setup-rc-local.sh


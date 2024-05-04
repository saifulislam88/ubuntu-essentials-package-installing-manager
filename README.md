#-------------------------------------------------------------------------------------------------------------------------------------------------------
#hostconfig.sh
#--------------------------------------------------------------------------------------------------------------------------------------------------------
**Host Configuration Script:**
This Bash script, hostconfig.sh, provides a simple and interactive way to configure the hostname and host file entries on Linux systems. 
It offers options to set the hostname, add new host file entries, modify existing entries, and view the current host file contents.

**Features:**
Set hostname interactively
Add multiple host file entries at once
Modify existing host file entries
View current host file contents
Easy to use and understand

**Usage:**
Run the script hostconfig.sh.
Follow the on-screen prompts to choose the desired action.
Input the required information as prompted.

**Requirements:**
Bash shell
Linux operating system


#-------------------------------------------------------------------------------------------------------------------------------------------------------
#Ubuntu Essentials Package Manager | Install-ubuntu-essentials-packages.sh
#-------------------------------------------------------------------------------------------------------------------------------------------------------
This Bash script, install-ubuntu-essentials-packages.sh, is a comprehensive package management tool tailored for Ubuntu servers. With over 9 years of professional experience in Ubuntu administration, I've curated a selection of essential packages commonly used for server management and maintenance tasks.

**Features:**
1.Installs a curated list of essential packages for Ubuntu server management.
2.Simplifies the installation process with a single script execution.
3.Packages selected based on extensive experience and best practices in Ubuntu server administration.

**Usage:**
1.Download the install-ubuntu-essentials-packages.sh script to your Ubuntu server.
2.Make the script executable with the command: chmod +x install-ubuntu-essentials-packages.sh.
3.Execute the script as root or with sudo privileges: sudo ./install-ubuntu-essentials-packages.sh.
4.Sit back and relax as the script installs the essential packages for Ubuntu server management.

**Package List:**
*System Management: htop, atop, sysstat, nmon, glances
*Network Tools: net-tools, iproute2, traceroute, tcpdump, nload
*Security Utilities: iptables, fail2ban, rkhunter, lynis
*Version Control: git
*Text Editors: vim, nano
*Compression Tools: gzip, bzip2, unzip, tar
*Monitoring and Performance: monitoring-plugins, collectd, prometheus-node-exporter
*Database Clients: mysql-client, mariadb-client
*Web Server Tools: curl, wget, apache2-utils
*Backup Utilities: rsync, duplicity, bacula
*SSH Tools: openssh-client, openssh-server
*File System Utilities: lvm2, e2fsprogs, xfsprogs

**Suggestions:**
1.Customize the package list based on your specific requirements and preferences.
2.Regularly update the script to include new packages or remove deprecated ones.
3.Use in conjunction with other server management practices for a robust and efficient Ubuntu server environment.

**Disclaimer:**
This script is provided as-is and without warranty. Use at your own risk. Always review and understand the actions performed by the script before execution.

**Feedback and Contributions:**
Your feedback and contributions are welcome! Feel free to suggest improvements or additional packages via GitHub pull requests or issues.

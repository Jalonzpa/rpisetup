#!/bin/bash
# Upgrades, y'all
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y

# Start up with ssh
sudo apt install openssh-server
update-rc.d -f ssh remove
update-rc.d -f ssh defaults

# New keys, anyone?
cd ~/
cd /etc/ssh/
mkdir insecure_old
mv ssh_host* insecure_old
sudo dpkg-reconfigure openssh-server

# How about some root login
cd ~/
sudo sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# Some mo' ssh
sudo service ssh restart
update-rc.d -f ssh enable 2 3 4 5
sudo service ssh start

# Switch it up
sudo echo "          
   / /   ___  / /( )_____   ____ ____  / /_   / /_/ /_  (_)____   / /_/ /_  (_)___  ____ _   ____ _____  (_)___  ____ _
  / /   / _ \/ __/// ___/  / __ `/ _ \/ __/  / __/ __ \/ / ___/  / __/ __ \/ / __ \/ __ `/  / __ `/ __ \/ / __ \/ __ `/
 / /___/  __/ /_  (__  )  / /_/ /  __/ /_   / /_/ / / / (__  )  / /_/ / / / / / / / /_/ /  / /_/ / /_/ / / / / / /_/ / 
/_____/\___/\__/ /____/   \__, /\___/\__/   \__/_/ /_/_/____/   \__/_/ /_/_/_/ /_/\__, /   \__, /\____/_/_/ /_/\__, /  
                         /____/                                                  /____/   /____/              /____/   " > /etc/motd

echo "We're all done now, boys"

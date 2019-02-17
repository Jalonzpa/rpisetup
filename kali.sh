#!/bin/bash
# Upgrades, y'all

echo "Hopefully this works my mans"
echo "Updating package lists..."
sudo apt update -y
echo "Upgrading packages..."
sudo apt upgrade -y

# Start up with ssh
echo "OpenSSH stuff..."
sudo apt install openssh-server
update-rc.d -f ssh remove
update-rc.d -f ssh defaults

# New keys, anyone?
echo "More SSH stuff but this time it's for da keys..."
cd ~/
cd /etc/ssh/
mkdir insecure_old
mv ssh_host* insecure_old
sudo dpkg-reconfigure openssh-server

# Some mo' ssh
echo "Even more SSH stuff when does it end..."
echo "SSH restart and enable"
sudo service ssh restart
update-rc.d -f ssh enable 2 3 4 5
sudo service ssh start

# Switch it up
echo "Finally done SSH"
echo "MOTD fun-nening..."
sudo echo \
"   __         __ _                     __     __  __    _         __  __    _                            _            
   / /   ___  / /( )_____   ____ ____  / /_   / /_/ /_  (_)____   / /_/ /_  (_)___  ____ _   ____ _____  (_)___  ____ _
  / /   / _ \/ __/// ___/  / __ `/ _ \/ __/  / __/ __ \/ / ___/  / __/ __ \/ / __ \/ __ `/  / __ `/ __ \/ / __ \/ __ `/
 / /___/  __/ /_  (__  )  / /_/ /  __/ /_   / /_/ / / / (__  )  / /_/ / / / / / / / /_/ /  / /_/ / /_/ / / / / / /_/ / 
/_____/\___/\__/ /____/   \__, /\___/\__/   \__/_/ /_/_/____/   \__/_/ /_/_/_/ /_/\__, /   \__, /\____/_/_/ /_/\__, /  
                         /____/                                                  /____/   /____/              /____/   " > /etc/motd

echo "We're all done now, boys"

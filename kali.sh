#!/bin/bash
# Upgrades, y'all
# Make sure to run as root or this will not work

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Hopefully this works my mans"
echo "Updating package lists..."
apt update -y
echo "Upgrading packages..."
apt upgrade -y

# Start up with ssh
echo "OpenSSH stuff..."
apt install openssh-server
update-rc.d -f ssh remove
update-rc.d -f ssh defaults

# New keys, anyone?
echo "More SSH stuff but this time it's for da keys..."
cd ~/
cd /etc/ssh/
mkdir insecure_old
mv ssh_host* insecure_old
dpkg-reconfigure openssh-server

# Some mo' ssh
echo "Even more SSH stuff when does it end..."
echo "SSH restart and enable"
service ssh restart
update-rc.d -f ssh enable 2 3 4 5
service ssh start

# Switch it up
echo "Finally done SSH"
echo "MOTD fun-nening..."
echo \
"   __         __ _                     __     __  __    _         __  __    _                            _            
   / /   ___  / /( )_____   ____ ____  / /_   / /_/ /_  (_)____   / /_/ /_  (_)___  ____ _   ____ _____  (_)___  ____ _
  / /   / _ \/ __/// ___/  / __ `/ _ \/ __/  / __/ __ \/ / ___/  / __/ __ \/ / __ \/ __ `/  / __ `/ __ \/ / __ \/ __ `/
 / /___/  __/ /_  (__  )  / /_/ /  __/ /_   / /_/ / / / (__  )  / /_/ / / / / / / / /_/ /  / /_/ / /_/ / / / / / /_/ / 
/_____/\___/\__/ /____/   \__, /\___/\__/   \__/_/ /_/_/____/   \__/_/ /_/_/_/ /_/\__, /   \__, /\____/_/_/ /_/\__, /  
                         /____/                                                  /____/   /____/              /____/   " > /etc/motd

echo "We're all done now, boys"

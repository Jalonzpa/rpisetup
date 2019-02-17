# Raspberry Pi setup scripts
Honestly they aren't that good. I just threw them together five minutes before booting up.
So don't get mad at me if something goes wrong.

## kali.sh
### This is a simple setup that I'm using for my Kali RPi. It does these things:
1. Updates and upgrades package lists
2. Installs openssh-server and allows it to run on boot
3. Backs up old SSH keys in /etc/ssh/insecure_old and generates new keys
4. Enables the SSH service and restarts it
5. Makes your MOTD fancy

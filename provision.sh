#!/bin/bash

echo "**"
echo "* Start provisioning..."
echo "**" && echo ""

echo "Change shell laguage to German.."
echo "XKBLAYOUT=\"de\"" > /etc/default/keyboard
echo "BACKSPACE=\"guess\"" >> /etc/default/keyboard
echo "XKBMODEL=\"pc105\"" >> /etc/default/keyboard
echo "XKBVARIANT=\"\"" >> /etc/default/keyboard
echo "XKBOPTIONS=\"\"" >> /etc/default/keyboard
sudo udevadm trigger --subsystem-match=input --action=change
echo "Completed!" && echo ""

echo "Install ansible..."
UBUNTU_CODENAME="jammy"
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu ${UBUNTU_CODENAME} main" | sudo tee /etc/apt/sources.list.d/ansible.list
sudo apt update && sudo apt install -y ansible
echo "Completed!" && echo ""

echo "**"
echo "* Provisioning completed!"
echo "**"
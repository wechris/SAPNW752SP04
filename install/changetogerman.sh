#!/bin/bash
echo "change keyboard and language..."
sudo sed -i 's/"english-us,pc104"/"german,pc104"/g' /etc/sysconfig/keyboard
# sudo sed -i 's/"en_US.UTF-8"/"de_DE.UTF-8"/g' /etc/sysconfig/language
# sudo sed -i 's/"en_US"/"de_DE"/g' /etc/sysconfig/language
sudo echo "KEYMAP=de-latin1-nodeadkeys" > /etc/vconsole.conf
sudo sed -i 's/"KEYMAP=us"/"KEYMAP=de-latin1-nodeadkeys"/g' /etc/vconsole.conf
sudo mkinitrd
sudo localectl set-keymap de

#!/bin/bash
echo "modify hostname..."
#sudo echo "10.0.2.15 vhcalnplci vhcalnplci.dummy.nodomain" > /etc/hosts
echo "Patching /etc/hosts ..."
echo "10.0.2.15 vhcalnplci vhcalnplci.dummy.nodomain" | sudo tee -a /etc/hosts
sudo sed -i.bak '/127.*vhcalnplci/d' /etc/hosts

echo "install tcsh..."
zypper --non-interactive --gpg-auto-import-keys in --auto-agree-with-licenses tcsh

echo "chmod install.sh..."
if [ -f /vagrant/sapinst/install.sh ]
then
  sudo chmod +x /vagrant/sapinst/install.sh
fi

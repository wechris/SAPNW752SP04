#!/bin/bash
echo "modify hostname..."
#sudo echo "10.0.2.15 vhcalnplci vhcalnplci.dummy.nodomain" > /etc/hosts
echo "Patching /etc/hosts ..."
echo "10.0.2.15 vhcalnplci vhcalnplci.dummy.nodomain" | sudo tee -a /etc/hosts
sudo sed -i.bak '/127.*vhcalnplci/d' /etc/hosts

echo "install tcsh..."
zypper --non-interactive --gpg-auto-import-keys in --auto-agree-with-licenses tcsh

echo "Check if SAP NW is installed..."
if [ -e /usr/sap ]; then
    echo "  seems SAP is already installed."
    exit 0
fi

echo "chmod install.sh..."
if [ ! -f /vagrant/sapinst/install.sh ]; then
    echo "  install.sh NOT found, NW installation not found, continue manually"
    exit 0
fi

echo "Try to install SAP NW..."
sudo cd /vagrant/sapinst/
sudo expect -f /vagrant/install/install_nw.expect


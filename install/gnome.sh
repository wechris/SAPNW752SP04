#!/bin/bash
echo "install Gnome..."
sudo zypper refresh && sudo zypper update
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses gnome-shell
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses metatheme-adwaita-common
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses gnome-shell-lang
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses gnome-desktop-lang
sudo zypper --non-interactive install --force-resolution --no-confirm --auto-agree-with-licenses patterns-openSUSE-gnome
echo "install Chromium..."
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses chromium
echo "install Terminal..."
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses gnome-terminal
echo "install FireFox..."
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses MozillaFirefox
echo "install libreoffice..."
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses libreoffice
echo "install GVim..."
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses gvim
echo "install YAST2..."
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses yast2
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses patterns-gnome-gnome_yast
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses yast2-control-center-qt
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses patterns-yast-yast2_basis
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses yast2-logs
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses yast2-printer
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses yast2-security
echo "install Nautilus Explorer..."
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses nautilus

echo "install VSCode..."
sudo zypper ar https://packages.microsoft.com/yumrepos/vscode vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'
sudo zypper refresh
sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses code

# echo "install CUPS..."
# sudo zypper --non-interactive addrepo https://download.opensuse.org/repositories/Printing/openSUSE_Leap_15.1/Printing.repo
# sudo zypper refresh
# sudo zypper --non-interactive install --no-confirm --auto-agree-with-licenses cups cups-config cups-client cups-pdf



sudo sed -i 's/"sddm"/"gdm"/g' /etc/sysconfig/displaymanager
sudo echo "/usr/bin/Xorg                 root:root       4711" >> /etc/permissions.local
sudo ln -svf /usr/lib/systemd/system/graphical.target /etc/systemd/system/default.target
sudo chkstat --system --set


echo "install JAVA..."
  wget "https://github.com/SAP/SapMachine/releases/download/sapmachine-11.0.2/sapmachine-jdk-11.0.2_linux-x64_bin.tar.gz" -O /home/vagrant/sapmachine-jdk-11.0.2_linux-x64_bin.tar.gz && touch java.is.done
if [ ! -d /usr/java ]; then
  sudo mkdir /usr/java
fi
sudo tar -xzf /home/vagrant/sapmachine-jdk-11.0.2_linux-x64_bin.tar.gz -C /usr/java
 
sudo ln -s /usr/sbin/update-alternatives /usr/sbin/alternatives
sudo alternatives --install "/usr/bin/java" "java" "/usr/java/sapmachine-11.0.2/bin/java" 1
sudo update-alternatives --set java /usr/java/sapmachine-11.0.2/bin/java
 
wget "https://download2.gluonhq.com/openjfx/11.0.2/openjfx-11.0.2_linux-x64_bin-jmods.zip" -O /home/vagrant/openjfx-11.0.2_linux-x64_bin-jmods.zip && touch fx.is.done
sudo unzip /home/vagrant/openjfx-11.0.2_linux-x64_bin-jmods.zip -d /home/vagrant/
sudo cp -r /home/vagrant/javafx-jmods-11.0.2/* /usr/java/sapmachine-11.0.2/jmods
sudo touch /usr/java/sapmachine-11.0.2/lib/javafx.properties

#Cleanup
sudo rm -rf /home/vagrant/sapmachine-jdk-11.0.2_linux-x64_bin.tar.gz
sudo rm -rf /home/vagrant/openjfx-11.0.2_linux-x64_bin-jmods.zip
sudo rm -rf /home/vagrant/javafx-jmods-11.0.2

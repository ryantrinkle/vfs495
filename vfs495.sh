#!/bin/bash

x="cat /etc/*release | grep DISTRIB_RELEASE"
eval $x
checkverion=`eval $x`
clear
echo $checkverion

clear

read -p "Press enter to continue"

# Step 1

if [ "$checkverion" == "DISTRIB_RELEASE=16.04" ];
	then
	sudo apt install libssl1.0.0 libusb-dev libcrypto++-dev libssl-dev libglib2.0-dev libmagickcore-dev libgtk2.0-dev libpam-dev
fi

if [ "$checkverion" == "DISTRIB_RELEASE=16.10" ];
	then
	sudo apt install libssl1.0.0 libusb-dev libssl-dev libglib2.0-dev libmagickcore-dev libgtk2.0-dev libpam-dev
	wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/libcrypto%2B%2B9_5.6.1-6%2Bdeb8u3_amd64.deb
	sudo dpkg -i libcrypto++9_5.6.1-6+deb8u3_amd64.deb
fi

if [ "$checkverion" == "DISTRIB_RELEASE=17.04" ];
	then
	sudo apt install libssl1.0.0 libusb-dev libssl-dev libglib2.0-dev libmagickcore-dev libgtk2.0-dev libpam-dev
	wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/libcrypto%2B%2B9_5.6.1-6%2Bdeb8u3_amd64.deb
	sudo dpkg -i libcrypto++9_5.6.1-6+deb8u3_amd64.deb
	read -p "Press enter to continue"
	wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/1704/libMagickCore-6.Q16.so.2.0.0
	sudo mv libMagickCore-6.Q16.so.2.0.0 /usr/lib/
	sudo ln /usr/lib/libMagickCore-6.Q16.so.2.0.0 /usr/lib/libMagickCore-6.Q16.so.2
fi

read -p "Press enter to continue"

# Step 2

wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/validity-sensor-setup_4.5-119_amd64.deb
sudo dpkg -i validity-sensor-setup_4.5-119_amd64.deb
read -p "Press enter to continue"

wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/libfprint_0.0.6-1_amd64.deb
sudo dpkg -i libfprint_0.0.6-1_amd64.deb
read -p "Press enter to continue"

wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/fprint-demo_0.4-1_amd64.deb
sudo dpkg -i fprint-demo_0.4-1_amd64.deb
read -p "Press enter to continue"

wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/pam-fprint_0.2-1_amd64.deb
sudo dpkg -i pam-fprint_0.2-1_amd64.deb
read -p "Press enter to continue"

# Step 3

sudo ln /usr/lib/x86_64-linux-gnu/libssl.so /usr/lib/libssl.so.0.9.8
sudo ln /usr/lib/libcryptopp.so.9 /usr/lib/libcrypto.so.0.9.8
read -p "Press enter to continue"

# Step 4

wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/vcsFPServiceDaemon
sudo mv vcsFPServiceDaemon /etc/init.d/
sudo chmod 0755 /etc/init.d/vcsFPServiceDaemon
sudo update-rc.d vcsFPServiceDaemon defaults
sudo /etc/init.d/vcsFPServiceDaemon start
read -p "Press enter to continue"

# Step 5

wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/fingerprint_auth/modified/common-auth
sudo mv common-auth /etc/pam.d
read -p "Press enter to continue"

# Step 6

sudo apt-mark hold fprint-demo
read -p "Press enter to continue"

# Step 7

sudo fprint_demo
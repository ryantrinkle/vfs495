#!/bin/bash

# Step 1

wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/debian/libssl1.0.0.deb
dpkg -i libssl1.0.0.deb

# Step 2

read -p "Press enter to continue"

apt install libusb-dev libssl-dev libglib2.0-dev libmagickcore-dev libgtk2.0-dev libpam-dev
wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/libcrypto%2B%2B9_5.6.1-6%2Bdeb8u3_amd64.deb
dpkg -i libcrypto++9_5.6.1-6+deb8u3_amd64.deb

read -p "Press enter to continue"

wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/1704/libMagickCore-6.Q16.so.2.0.0
mv libMagickCore-6.Q16.so.2.0.0 /usr/lib/
ln /usr/lib/libMagickCore-6.Q16.so.2.0.0 /usr/lib/libMagickCore-6.Q16.so.2

read -p "Press enter to continue"

# Step 3

wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/validity-sensor-setup_4.5-119_amd64.deb
dpkg -i validity-sensor-setup_4.5-119_amd64.deb
read -p "Press enter to continue"

wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/libfprint_0.0.6-1_amd64.deb
dpkg -i libfprint_0.0.6-1_amd64.deb
read -p "Press enter to continue"

wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/fprint-demo_0.4-1_amd64.deb
dpkg -i fprint-demo_0.4-1_amd64.deb
read -p "Press enter to continue"

wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/pam-fprint_0.2-1_amd64.deb
dpkg -i pam-fprint_0.2-1_amd64.deb
read -p "Press enter to continue"

# Step 4

ln /usr/lib/libcryptopp.so.9 /usr/lib/libcrypto.so.0.9.8
read -p "Press enter to continue"

# Step 5

wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/vcsFPServiceDaemon
mv vcsFPServiceDaemon /etc/init.d/
chmod 0755 /etc/init.d/vcsFPServiceDaemon
update-rc.d vcsFPServiceDaemon defaults
/etc/init.d/vcsFPServiceDaemon start
read -p "Press enter to continue"

# Step 6

wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/fingerprint_auth/modified/common-auth
mv common-auth /etc/pam.d
read -p "Press enter to continue"

# Step 7

ln -s /usr/lib/x86_64-linux-gnu/libssl.so.1.0.0 /usr/lib/libssl.so.10
ln -s /usr/lib/x86_64-linux-gnu/libssl.so.1.0.0 /usr/lib/libssl.so.0.9.8

# Step 8

apt-mark hold fprint-demo
read -p "Press enter to continue"

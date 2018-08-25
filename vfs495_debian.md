# Validity VFS495 (138a:003f) driver and utilities for Debian 9

### (almost) Auto setup

1. Open a terminal (as normal user; not as root)
2. Run into terminal `mkdir vfs495 && cd vfs495`
3. Download autoinstall script with `wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/vfs495_debian.sh`
4. Log in as root with `su`
5. Run into terminal `chmod +x vfs495_debian.sh && ./vfs495_debian.sh`
6. Let the script do its magic (you will need to press Enter sometimes, though)
7. Reboot the system
8. After the system is restarted and you are logged in open fprint_demo (run `fprint_demo` into terminal)
9. Reboot (again)
10. In the log-in screen press Enter and scan your finger. Press Enter once again to log-in (or to rescan your finger).
* For GNOME Shell press Enter, in the password input prompt type any character, press Enter again and scan your finger. 
* For XFCE press two times the log-in button and scan your finger.
* For other DEs, you tell me!

### Manual setup

1. Open a terminal and log in as root with `su`
2. Install `multiarch-support` with `apt install multiarch-support`
3. Download and install  `libssl1.0.0` with `wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/debian/libssl1.0.0.deb && dpkg -i libssl1.0.0.deb`
4. Install required dependencies with `apt install libusb-dev libssl-dev libglib2.0-dev libmagickcore-dev libgtk2.0-dev libpam-dev`
5. Download and install libcrypto with `wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/libcrypto%2B%2B9_5.6.1-6%2Bdeb8u3_amd64.deb && dpkg -i libcrypto++9_5.6.1-6+deb8u3_amd64.deb`
6. Run these commands **IN THIS ORDER**
* `wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/1704/libMagickCore-6.Q16.so.2.0.0`
* `mv libMagickCore-6.Q16.so.2.0.0 /usr/lib/`
* `ln /usr/lib/libMagickCore-6.Q16.so.2.0.0 /usr/lib/libMagickCore-6.Q16.so.2`
7. Download and install these packages **IN THIS ORDER**
* [validity-sensor-setup_4.5-119_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/validity-sensor-setup_4.5-119_amd64.deb?raw=true)
* [libfprint_0.0.6-1_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/libfprint_0.0.6-1_amd64.deb?=raw=true)
* [fprint-demo_0.4-1_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/blob/master/Packages/fprint-demo_0.4-1_amd64.deb?raw=true)
* [pam-fprint_0.2-1_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/blob/master/Packages/pam-fprint_0.2-1_amd64.deb?raw=true)
8. Run this command: `ln /usr/lib/libcryptopp.so.9 /usr/lib/libcrypto.so.0.9.8`
9. Create init script using these commands **IN THIS ORDER**
* `wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/vcsFPServiceDaemon`
* `sudo mv vcsFPServiceDaemon /etc/init.d/`
* `sudo chmod 0755 /etc/init.d/vcsFPServiceDaemon`
* `sudo update-rc.d vcsFPServiceDaemon defaults`
* `sudo /etc/init.d/vcsFPServiceDaemon start`
10. Enable fingerprint login using these commands **IN THIS ORDER**
* `wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/fingerprint_auth/modified/common-auth`
* `mv common-auth /etc/pam.d`
11. Run these commands **IN THIS ORDER**
* `ln -s /usr/lib/x86_64-linux-gnu/libssl.so.1.0.0 /usr/lib/libssl.so.10`
* `ln -s /usr/lib/x86_64-linux-gnu/libssl.so.1.0.0 /usr/lib/libssl.so.0.9.8`
12. Prevent fprint_demo from updating using ` apt-mark hold fprint-demo`
13. Reboot
14. After the system is restarted and you are logged in open fprint_demo (run `fprint_demo` into terminal)

# Validity VFS495 (138a:003f) driver and utilities for Ubuntu (16.04 / 17.04 / 17.10)

### (almost) Auto setup
1. `wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/vfs495.sh` <br/>
2. `sudo chmod +x vfs495.sh`
3. `sudo ./vfs495.sh`

### Manual setup

1.  Install dependencies with `sudo apt install libssl1.0.0 libusb-dev libcrypto++-dev libssl-dev libglib2.0-dev libmagickcore-dev libgtk2.0-dev libpam-dev`
* For Ubuntu 16.10, 17.04 and 17.10 `sudo apt install libssl1.0.0 libusb-dev libssl-dev libglib2.0-dev libmagickcore-dev  libgtk2.0-dev libpam-dev` and download and install [this](https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/libcrypto%2B%2B9_5.6.1-6%2Bdeb8u3_amd64.deb) package <br/> <br/>
**Also (only for 17.04 and 17.10) run these commands IN THIS ORDER** <br/>
1'. `wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/1704/libMagickCore-6.Q16.so.2.0.0` <br/>
2'. `sudo mv libMagickCore-6.Q16.so.2.0.0 /usr/lib/` <br/>
3'. `sudo ln /usr/lib/libMagickCore-6.Q16.so.2.0.0 /usr/lib/libMagickCore-6.Q16.so.2`
2. Download and install the following packages **IN THIS ORDER**
* [validity-sensor-setup_4.5-119_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/blob/master/Packages/validity-sensor-setup_4.5-119_amd64.deb?raw=true)
* [libfprint_0.0.6-1_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/blob/master/Packages/libfprint_0.0.6-1_amd64.deb?raw=true)
* [fprint-demo_0.4-1_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/blob/master/Packages/fprint-demo_0.4-1_amd64.deb?raw=true)
* [pam-fprint_0.2-1_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/blob/master/Packages/pam-fprint_0.2-1_amd64.deb?raw=true)
3. Run the following commands **IN THIS ORDER** (or use [link.sh](https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/link.sh))
* `sudo ln /usr/lib/x86_64-linux-gnu/libssl.so /usr/lib/libssl.so.0.9.8`
* `sudo ln /usr/lib/libcryptopp.so.9 /usr/lib/libcrypto.so.0.9.8`
4. Create init script using these commands **IN THIS ORDER** (or use [initscript.sh](https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/initscript.sh))
* `wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/vcsFPServiceDaemon`
* `sudo mv vcsFPServiceDaemon /etc/init.d/`
* `sudo chmod 0755 /etc/init.d/vcsFPServiceDaemon`
* `sudo update-rc.d vcsFPServiceDaemon defaults`
* `sudo /etc/init.d/vcsFPServiceDaemon start`
5. Enable fingerprint login using these commands **IN THIS ORDER**
* `wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/fingerprint_auth/modified/common-auth`
* `sudo mv common-auth /etc/pam.d`
6. Prevent fprint_demo from updating usign `sudo apt-mark hold fprint-demo`
7. Enroll a finger using fprint_demo with `sudo fprint_demo`
8. Reboot
9. In the log-in screen press Enter and scan your finger. Press Enter once again to log-in (or to rescan your finger).
* For GNOME Shell press Enter, in the password input prompt type any character, press Enter again and scan your finger. 
* For XFCE press two times the log-in button and scan your finger.

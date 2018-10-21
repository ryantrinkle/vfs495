# Validity VFS495 (138a:003f) driver and utilities for Ubuntu 18.04/18.10

### (almost) Auto setup

Coming soon

### Manual setup

1.  Install dependencies with `sudo apt install libssl1.0.0 libusb-dev libssl-dev libglib2.0-dev libmagickcore-dev  libgtk2.0-dev libpam-dev` and download and install [this](https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/libcrypto%2B%2B9_5.6.1-6%2Bdeb8u3_amd64.deb) package <br/>
2. Run these commands **IN THIS ORDER** <br/>
* `wget https://github.com/PetreBoboc/vfs495_ubuntu/raw/master/Packages/1704/libMagickCore-6.Q16.so.2.0.0` <br/>
* `sudo mv libMagickCore-6.Q16.so.2.0.0 /usr/lib/` <br/>
* `sudo ln /usr/lib/libMagickCore-6.Q16.so.2.0.0 /usr/lib/libMagickCore-6.Q16.so.2`

3. Download and install the following packages **IN THIS ORDER**
* [validity-sensor-setup_4.5-119_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/blob/master/Packages/validity-sensor-setup_4.5-119_amd64.deb?raw=true)
* [libfprint_0.0.6-1_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/blob/master/Packages/libfprint_0.0.6-1_amd64.deb?raw=true)
* [fprint-demo_0.4-1_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/blob/master/Packages/fprint-demo_0.4-1_amd64.deb?raw=true)
* [pam-fprint_0.2-1_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/blob/master/Packages/pam-fprint_0.2-1_amd64.deb?raw=true)
4. Run the following commands **IN THIS ORDER**
* `sudo ln -s /usr/lib/x86_64-linux-gnu/libssl.so /usr/lib/libssl.so.0.9.8`
* `sudo ln -s /usr/lib/libcryptopp.so.9 /usr/lib/libcrypto.so.0.9.8`
5. Create init script using these commands **IN THIS ORDER**
* `wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/vcsFPServiceDaemon`
* `sudo mv vcsFPServiceDaemon /etc/init.d/`
* `sudo chmod 0755 /etc/init.d/vcsFPServiceDaemon`
* `sudo update-rc.d vcsFPServiceDaemon defaults`
* `sudo /etc/init.d/vcsFPServiceDaemon start`
6. Enable fingerprint login using these commands **IN THIS ORDER**
* `wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/fingerprint_auth/modified/common-auth`
* `sudo mv common-auth /etc/pam.d`
7. Prevent fprint_demo from updating usign `sudo apt-mark hold fprint-demo`
8. Enroll a finger using fprint_demo with `sudo fprint_demo`
9. Reboot
10. In the log-in screen press Enter and scan your finger. Press Enter once again to log-in (or to rescan your finger).
* For GNOME Shell press Enter, in the password input prompt type any character, press Enter again and scan your finger. 
* For XFCE press two times the log-in button and scan your finger.

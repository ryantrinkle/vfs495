# vfs495_ubuntu
Validity VFS495 (138a:003f) drivers &amp; utilities for Ubuntu 16.04
<br/><br/>

### Setup

1.  Install dependencies with `sudo apt install alien libssl1.0.0 libssl-dev libusb-dev libcrypto++-dev libssl-dev libglib2.0-dev libmagickcore-dev checkinstall libgtk2.0-dev libpam-dev`
2. Download and install the following packages
* [validity-sensor-setup_4.5-119_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/blob/master/Packages/validity-sensor-setup_4.5-119_amd64.deb?raw=true)
* [libfprint_0.0.6-1_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/blob/master/Packages/libfprint_0.0.6-1_amd64.deb?raw=true)
* [fprint-demo_0.4-1_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/blob/master/Packages/fprint-demo_0.4-1_amd64.deb?raw=true)
* [pam-fprint_0.2-1_amd64.deb](https://github.com/PetreBoboc/vfs495_ubuntu/blob/master/Packages/pam-fprint_0.2-1_amd64.deb?raw=true)
3. Run the following commands IN THIS ORDER (or use [link.sh](https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/link.sh))
* `sudo ln /usr/lib/x86_64-linux-gnu/libssl.so /usr/lib/libssl.so.0.9.8`
* `sudo ln /usr/lib/libcryptopp.so.9 /usr/lib/libcrypto.so.0.9.8`
4. Create init script using these commands IN THIS ORDER (or use [initscript.sh](https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/initscript.sh))
* `wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/vcsFPServiceDaemon`
* `sudo cp vcsFPServiceDaemon /etc/init.d/`
* `sudo chmod 0777 /etc/init.d/vcsFPServiceDaemon`
* `sudo update-rc.d vcsFPServiceDaemon defaults`
* `sudo /etc/init.d/vcsFPServiceDaemon start`
5. Enable fingerprint login using these commands IN THIS ORDER
* `wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/fingerprint_auth/modified/common-auth`
* `sudo cp common-auth /etc/pam.d`
6. Prevent fprint_demo from updating usign `sudo apt-mark hold fprint-demo`
7. Enroll a finger using fprint_demo
* Run `sudo /etc/init.d/vcsFPServiceDaemon start` (you will only run this only one time)
* Run `sudo fprint_demo` and enroll a finger (e.i. Right index)
8. Reboot
9. In the log-in screen press Enter and scan your finger. Press Enter once again to log-in (or to rescan your finger).
* For GNOME Shell press Enter, in the password input prompt type any character, press Enter again and scan your finger. 
---------

For more help, feel free to email me: **bobocpetre98@gmail.com** 

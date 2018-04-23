# Validity VFS495 (138a:003f) driver and utilities for Debian

### (almost) Auto setup

1. Open a terminal (as normal user; not as root)
2. Run into terminal `mkdir vfs495 && cd vfs495`
3. Download autoinstall script with `wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/vfs495_debian.sh`
4. Log is as root with `su`
5. Run into terminal `chmod +x vfs495_debian.sh && ./vfs495.sh`
6. Let the script do its magic (you will need to press Enter sometimes, thought)
7. Reboot the system
8. After the system is restarted and you are logged in open fprint_demo (run `fprint_demo` into terminal)
9. Reboot (again)
10. In the log-in screen press Enter and scan your finger. Press Enter once again to log-in (or to rescan your finger).
* For GNOME Shell press Enter, in the password input prompt type any character, press Enter again and scan your finger. 
* For XFCE press two times the log-in button and scan your finger.
* For other DEs, you tell me!

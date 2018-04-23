#!/bin/bash

wget https://raw.githubusercontent.com/PetreBoboc/vfs495_ubuntu/master/vcsFPServiceDaemon
sudo cp vcsFPServiceDaemon /etc/init.d/
sudo chmod 0777 /etc/init.d/vcsFPServiceDaemon
sudo update-rc.d vcsFPServiceDaemon defaults
sudo /etc/init.d/vcsFPServiceDaemon start

#initscript.sh and vcsFPServiceDaemon must be in the same folder

#!/bin/bash

read -p "Shutdown after build is completed?" yn
case $yn in
     [y]*)  read -p "Enter user password: " user_password
             ;;
     [n]*)   ;;
     *) echo "Please answer y or n."
             ;;
esac

read -p "Sync ROM repo's before building?" yn_repo
case $yn_repo in
     [y]*)   ;;
     [n]*)   ;;
     *) echo "Please answer y or n."
             ;;
esac

read -p "Enter device name: " device_name

Common () {
if [ $yn_repo = "y" ]; then
   repo sync -c -f -j4 --force-sync --no-clone-bundle --no-tags
fi	
	
source build/envsetup.sh
prebuilts/misc/linux-x86/ccache/ccache -M 50G
breakfast $device_name
brunch $device_name
cd out/target/product/$device_name/
cp -a *.zip '/media/shivam/SHIVAM/ANDROID/ROMS & MODS/MI4/My Builds/N'
rm -rf system/ *.img *.md5sum *.txt *.mk kernel ota* ramdisk-recovery.cpio recovery.id *.zip
}

cd ~/Android/aicp-n/
Common

cd ~/Android/cm14/
Common

cd ~/Android/crdroid-n/
Common

if [ $yn = "y" ]; then
   echo $user_password | sudo -S poweroff  
fi

exit

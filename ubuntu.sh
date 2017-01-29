#!/bin/bash

yellow='\033[0;33m'

echo -e "$yellow Adding Repositories"
add-apt-repository -y ppa:plushuang-tw/uget-stable
add-apt-repository -y ppa:webupd8team/pulseaudio-eq
add-apt-repository -y ppa:nilarimogard/webupd8
add-apt-repository -y ppa:videolan/stable-daily
add-apt-repository -y ppa:bumblebee/stable
add-apt-repository -y ppa:xorg-edgers/ppa
add-apt-repository -y ppa:otto-kesselgulasch/gimp
add-apt-repository -y ppa:gnome3-team/gnome3
apt-add-repository -y ppa:strukturag/libde265 
add-apt-repository -y ppa:webupd8team/y-ppa-manager
apt-add-repository -y 'deb http://liveusb.info/multisystem/depot all main'
add-apt-repository -y 'deb http://dl.google.com/linux/chrome/deb/ stable main'
add-apt-repository -y ppa:flexiondotorg/hal-flash
sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.10/ /' >> /etc/apt/sources.list.d/arc-theme.list"

apt-get update -y 

echo -e "$yellow Installing applications..."
apt-get install -y --allow-unauthenticated uget
apt-get install -y --allow-unauthenticated mousepad
apt-get install -y --allow-unauthenticated libhal1-flash
apt-get install -y --allow-unauthenticated arc-theme
apt-get install -y --allow-unauthenticated unity-tweak-tool
apt-get install -y --allow-unauthenticated adobe-flashplugin
apt-get install -y --allow-unauthenticated vlc 
apt-get install -y --allow-unauthenticated vlc-plugin-libde265
apt-get install -y --allow-unauthenticated google-chrome-stable 
apt-get install -y --allow-unauthenticated gimp 
apt-get install -y --allow-unauthenticated gimp-data 
apt-get install -y --allow-unauthenticated gimp-plugin-registry 
apt-get install -y --allow-unauthenticated gimp-data-extras 
apt-get install -y --allow-unauthenticated flashplugin-installer 
apt-get install -y --allow-unauthenticated unace 
apt-get install -y --allow-unauthenticated unrar 
apt-get install -y --allow-unauthenticated unzip 
apt-get install -y --allow-unauthenticated p7zip-full 
apt-get install -y --allow-unauthenticated p7zip-rar 
apt-get install -y --allow-unauthenticated sharutils 
apt-get install -y --allow-unauthenticated rar 
apt-get install -y --allow-unauthenticated unrar 
apt-get install -y --allow-unauthenticated uudeview 
apt-get install -y --allow-unauthenticated mpack 
apt-get install -y --allow-unauthenticated arj 
apt-get install -y --allow-unauthenticated cabextract 
apt-get install -y --allow-unauthenticated transmission
apt-get install -y --allow-unauthenticated geany
apt-get install -y --allow-unauthenticated gparted
apt-get install -y --allow-unauthenticated udisks
apt-get install -y --allow-unauthenticated simplescreenrecorder

echo -e "$yellow Pulse Audio Installation..."
wget http://cgit.freedesktop.org/pulseaudio/pulseaudio/plain/src/utils/qpaeq -O /tmp/qpaeq
sudo install /tmp/qpaeq /usr/local/bin/
apt-get install -y --allow-unauthenticated python-dbus python-qt4 python-qt4-dbus pulseaudio-utils
apt-get install -y --allow-unauthenticated pulseaudio-equalizer pulseaudio pavucontrol
pulseaudio -k
pactl load-module module-equalizer-sink
pactl load-module module-dbus-protocol
rm -rf ~/.config/pulse
rm -rf ~/.pulse

echo -e "$yellow Setting up Android Build Environment..."
apt-get install -y --allow-unauthenticated bc bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline6-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush schedtool squashfs-tools xsltproc zip zlib1g-dev
apt-get install -y --allow-unauthenticated openjdk-8-jdk
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

echo -e "$yellow Installing Apps which may require user attention..."
apt-get install -y --allow-unauthenticated ubuntu-restricted-extras

echo -e "$yellow Set menu to always show..."
gsettings set com.canonical.Unity always-show-menus true

echo -e "$yellow Removal of default unrequired apps."
apt-get remove -y --allow-unauthenticated rhythmbox ekiga totem* ubuntu-one* unity-lens-music unity-lens-friends unity-lens-photos unity-lens-video thunderbird* apport
apt-get remove -y --allow-unauthenticated firefox gedit

echo -e "$yellow Removal of NSA PRISM search tools provided by unity."
gsettings set com.canonical.Unity.Lenses remote-content-search none

echo -e "$yellow Clean packages downloaded"
aptitude autoclean -y

echo -e "$yellow Cleaning Up"; 
apt-get -f -y --allow-unauthenticated install 
apt-get -y --allow-unauthenticated autoremove 
apt-get -y --allow-unauthenticated autoclean 
apt-get -y --allow-unauthenticated clean

apt-get update -y 

exit





#!/bin/bash

curl -fsSL https://slackware.uk/cumulative/slackware64-15.0/slackware64/x/libXv-1.0.11-x86_64-4.txz -o /tmp/libXv-1.0.11-x86_64-4.txz
upgradepkg --install-new /tmp/libXv-1.0.11-x86_64-4.txz
rm /tmp/libXv-1.0.11-x86_64-4.txz

nvidia-smi -r
nvidia-persistenced --persistence-mode
cp /boot/config/xorg.conf /etc/X11/xorg.conf
export DISPLAY=:0.0
xinit /usr/bin/nvidia-settings -a "[gpu:0]/GPULogoBrightness=0"
echo "====================Mission Accomplished===================="

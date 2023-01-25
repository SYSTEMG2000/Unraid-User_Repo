#!/bin/bash
# This naive script will setup the environment for Unraid 6.11.5 to run nvidia-settings with xinit virtual display. 
# Please read the comments and modify the script carefully to make it work as expected. 
# Please set schedule to "At first Array Start Only".

# This defines the directory to download the required packages. It's recommended to set it somewhere in your cache pool.
cd /mnt/user/system/libXserver/

# The following packages are preinstalled with Unraid 6.11.5. There's no need to download them unless the script is deployed on other distribution or OS.
#libdrm-2.4.114-x86_64-1.txz
#nettle-3.8.1-x86_64-1.txz
#utempter-1.2.0-x86_64-3.txz

# The following lines download the required packages. They are only needed at the first execution of the script.
# Please delete these lines after confirming packages are downloaded without error.
echo "/slackware/slackware64-current/slackware64/x/libX11-1.8.3-x86_64-2.txz
/slackware/slackware64-current/slackware64/x/libXext-1.3.5-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libxcb-1.15-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libXau-1.0.11-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libXdmcp-1.1.4-x86_64-1.txz
/slackware/slackware64-current/slackware64/l/gtk+2-2.24.33-x86_64-3.txz
/slackware/slackware64-current/slackware64/l/gtk+3-3.24.36-x86_64-1.txz
/slackware/slackware64-current/slackware64/l/atk-2.38.0-x86_64-1.txz
/slackware/slackware64-current/slackware64/l/gdk-pixbuf2-2.42.10-x86_64-1.txz
/slackware/slackware64-current/slackware64/l/pango-1.50.12-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libXrender-0.9.11-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libXinerama-1.1.5-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libXi-1.8-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libXrandr-1.5.3-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libXcursor-1.2.1-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libXcomposite-0.4.6-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libXdamage-1.1.6-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libXfixes-6.0.0-x86_64-1.txz
/slackware/slackware64-current/slackware64/l/cairo-1.16.0-x86_64-3.txz
/slackware/slackware64-current/slackware64/l/harfbuzz-6.0.0-x86_64-1.txz
/slackware/slackware64-current/slackware64/l/freetype-2.12.1-x86_64-1.txz
/slackware/slackware64-current/slackware64/l/graphite2-1.3.14-x86_64-3.txz
/slackware/slackware64-current/slackware64/x/fontconfig-2.13.92-x86_64-3.txz
/slackware/slackware64-current/slackware64/l/fribidi-1.0.12-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/xinit-1.4.2-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/xorg-server-21.1.6-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libxcvt-0.1.2-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libXfont2-2.0.6-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libxshmfence-1.3.2-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libfontenc-1.1.7-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/xkeyboard-config-2.37-noarch-1.txz
/slackware/slackware64-current/slackware64/x/xkbcomp-1.4.6-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libxkbfile-1.1.2-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libXv-1.0.12-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/xf86-input-evdev-2.10.6-x86_64-4.txz
/slackware/slackware64-current/slackware64/x/xf86-input-libinput-1.2.1-x86_64-2.txz
/slackware/slackware64-current/slackware64/x/libevdev-1.13.0-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/libinput-1.22.1-x86_64-1.txz
/slackware/slackware64-current/slackware64/x/mtdev-1.1.6-x86_64-3.txz
/slackware/slackware64-current/slackware64/x/libwacom-2.6.0-x86_64-1.txz
" | xargs -n 1 -P 40 wget

# Installation process is needed at every execution since Unraid clean off the system at every boot.
upgradepkg --install-new /mnt/user/system/libXserver/libX11-1.8.3-x86_64-2.txz
upgradepkg --install-new /mnt/user/system/libXserver/libXext-1.3.5-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libxcb-1.15-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libXau-1.0.11-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libXdmcp-1.1.4-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/gtk+2-2.24.33-x86_64-3.txz
upgradepkg --install-new /mnt/user/system/libXserver/gtk+3-3.24.36-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/atk-2.38.0-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/gdk-pixbuf2-2.42.10-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/pango-1.50.12-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libXrender-0.9.11-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libXinerama-1.1.5-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libXi-1.8-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libXrandr-1.5.3-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libXcursor-1.2.1-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libXcomposite-0.4.6-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libXdamage-1.1.6-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libXfixes-6.0.0-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/cairo-1.16.0-x86_64-3.txz
upgradepkg --install-new /mnt/user/system/libXserver/harfbuzz-6.0.0-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/freetype-2.12.1-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/graphite2-1.3.14-x86_64-3.txz
upgradepkg --install-new /mnt/user/system/libXserver/fontconfig-2.13.92-x86_64-3.txz
upgradepkg --install-new /mnt/user/system/libXserver/fribidi-1.0.12-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/xinit-1.4.2-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/xorg-server-21.1.6-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libxcvt-0.1.2-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libXfont2-2.0.6-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libxshmfence-1.3.2-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libfontenc-1.1.7-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/xkeyboard-config-2.37-noarch-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/xkbcomp-1.4.6-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libxkbfile-1.1.2-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libXv-1.0.12-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/xf86-input-evdev-2.10.6-x86_64-4.txz
upgradepkg --install-new /mnt/user/system/libXserver/xf86-input-libinput-1.2.1-x86_64-2.txz
upgradepkg --install-new /mnt/user/system/libXserver/libevdev-1.13.0-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/libinput-1.22.1-x86_64-1.txz
upgradepkg --install-new /mnt/user/system/libXserver/mtdev-1.1.6-x86_64-3.txz
upgradepkg --install-new /mnt/user/system/libXserver/libwacom-2.6.0-x86_64-1.txz

# Reset GPU state just in case.
nvidia-smi -r
# Set GPU to persistence mode. This can also lower the gpu power at idle.
nvidia-persistenced --persistence-mode
# The following command generates xorg.conf with some customized settings for nvidia GPU. This may not be optimized configuration.
nvidia-xconfig --cool-bits=31 --allow-empty-initial-configuration --use-display-device=None --virtual=300x200
# One can edit the xorg.conf file for optimization for specific use cases(such as multi-GPU). The following command copy the customized config file to the xorg configuration directory.
#cp /mnt/user/system/libXserver/xorg.conf /etc/X11/xorg.conf
export DISPLAY=:0.0
# The two lines are examples of different ways to set GPU attributes. It's recommended to use .xinitrc when having a long list of configuration. 
#xinit /usr/bin/nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=75 -a [fan:1]/GPUTargetFanSpeed=75
#xinit /mnt/user/system/libXserver/gpuinit.xinitrc -- /usr/bin/X -br
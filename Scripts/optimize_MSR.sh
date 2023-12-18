#!/bin/bash

# Write XMRig Optimized MSR values
# https://github.com/xmrig/xmrig/blob/master/scripts/randomx_boost.sh

VERSION=1.3

echo "================================"
echo "Installing msr-tools v${VERSION}"
echo "================================"
curl -fsSL https://packages.slackonly.com/pub/packages/15.0-x86_64/system/msr-tools/msr-tools-${VERSION}-x86_64-1_slonly.txz -o /tmp/msr-tools-${VERSION}-x86_64-1_slonly.txz
upgradepkg --install-new /tmp/msr-tools-${VERSION}-x86_64-1_slonly.txz
rm /tmp/msr-tools-${VERSION}-x86_64-1_slonly.txz

echo "===================================="
echo "Optimizing register values for XMRig"
echo "===================================="
MSR_FILE=/sys/module/msr/parameters/allow_writes

if test -e "$MSR_FILE";
    then
        echo on > $MSR_FILE
    else
        modprobe msr allow_writes=on
fi

if grep -E 'AMD Ryzen|AMD EPYC' /proc/cpuinfo > /dev/null;
    then
        if grep "cpu family[[:space:]]\{1,\}:[[:sapce:]]25" /proc/cpuinfo > dev/null;
            then
                if grep "model[[:space:]]\{1,\}[[:space:]]97" /proc/cpuinfo > /dev/null;
                    then
                        echo "Zen4 CPU Detected"
                        wrmsr -a 0xc0011020 0x4400000000000
                        wrmsr -a 0xc0011021 0x4000000000040
                        wrmsr -a 0xc0011022 0x8680000401570000
                        wrmsr -a 0xc001102b 0x2040cc10
                        echo "MSR Register Values for Zen4 Applied"
                    else
                        echo "Zen3 CPU Detected"
                        wrmsr -a 0xc0011020 0x4480000000000
                        wrmsr -a 0xc0011021 0x1c000200000040
                        wrmsr -a 0xc0011022 0xc000000401570000
                        wrmsr -a 0xc001102b 0x2000cc10
                        echo "MSR Register Values for Zen3 Applied"
                fi
            else
                echo "Zen1/Zen2 CPU Detected"
                wrmsr -a 0xc0011020 0x0
                wrmsr -a 0xc0011021 0x40
                wrmsr -a 0xc0011022 0x1510000
                wrmsr -a 0xc001102b 0x2000cc16
                echo "MSR Register Values for Zen1/Zen2 Applied"
        fi
    elif grep "Intel" /proc/cpuinfo > /dev/null;
        then
            echo "Intel CPU Detected"
            wrmsr -a 0x1a4 0xf
            echo "MSR Register Value for Intel Applied"
        else
            echo "No Supported CPU Detected"
    fi

echo "====================Mission Accomplished===================="
echo "=========To reset values, please reboot your server========="

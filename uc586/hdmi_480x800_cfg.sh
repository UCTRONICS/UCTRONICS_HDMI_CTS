#!/bin/sh

# Setup GPIO for Arducam Multi Adapter Board Pi zero
# Disable the camera_led
echo "Begin to configure the 480x800 resolution..."
awk 'BEGIN{ count=0 }       \
{                           \
    if($1 == "hdmi_force_hotplug=1"){       \
        count++;            \
    }                       \
}END{                       \
    if(count <= 0){         \
	system("sudo sh -c '\''echo hdmi_force_hotplug=1 >> /boot/config.txt'\''"); \
        system("sudo sh -c '\''echo max_usb_current=1 >> /boot/config.txt'\''"); \
    	system("sudo sh -c '\''echo hdmi_group=2 >> /boot/config.txt'\''"); \
	system("sudo sh -c '\''echo hdmi_mode=87 >> /boot/config.txt'\''"); \
	system("sudo sh -c '\''echo hdmi_cvt 800 480 60 6 0 0 0 >> /boot/config.txt'\''"); \
	system("sudo sh -c '\''echo hdmi_drive=1 >> /boot/config.txt'\''"); \
	}                       \
}' /boot/config.txt 
echo "480x800 resolution configure OK."

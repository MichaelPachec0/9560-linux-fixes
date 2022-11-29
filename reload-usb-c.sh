#!/bin/env sh



#thunderbolt_check=$(lspci | grep "\[Alpine Ridge")
thunderbolt_check=$(lspci | grep '\[Alpine Ridge 2C 2015\]')
usb_check=$(lspci | grep "\[Alpine Ridge\]")
if [[ "${#thunderbolt_check}" -eq 359 && -z "$usb_check"  ]]; then
	# state where we can turn on usb controller again
	# echo 1 > /sys/bus/pci/rescan
	echo "You got my attention..."
elif [[ "${thunderbolt_check}" -lt 359 && "${#thunderbolt_check}" -gt 0  ]]; then
	# account for inrecoverable state, should reboot when most convinient
	echo "He's  dead jim"
else
	# the usb controller is already turned on, we should not be here
	echo "We have the usb-c subsytem already enabled"
fi

#!/bin/env sh

thunderbolt_check=$(lspci | grep "\[Alpine Ridge")

if [ -z "$thunderbolt_check" ]; then
	echo 1 > /sys/bus/pci/rescan
else
	echo "We have the usb-c subsytem already enabled"
fi

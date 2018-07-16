platform_check_image() {
	return 0
}

platform_do_upgrade() {	
	echo "1" > /sys/class/leds/red\:status/brightness
	mtd write /tmp/firmware.img rootfs	
	if [ "$SAVE_CONFIG" -eq 1 ]; then
		ehco "keep config"
	else
		mtd erase rootfs_data
	fi
}

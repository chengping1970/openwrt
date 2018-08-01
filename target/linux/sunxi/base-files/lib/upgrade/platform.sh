platform_check_image() {
	return 0
}

platform_do_upgrade() {	
	echo "1" > /sys/class/leds/red\:status/brightness
	if [ "$SAVE_CONFIG" -eq 1 ]; then
		echo "keep config"
	else
		mtd erase rootfs_data
	fi
	mtd write /tmp/firmware.img rootfs
}

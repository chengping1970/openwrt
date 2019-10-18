platform_check_image() {
	return 0
}

platform_do_upgrade() {	
	echo "0" > /sys/class/leds/red\:status/brightness
	if [ "$SAVE_CONFIG" -eq 1 ]; then
		echo "keep config"
	else
		mtd erase rootfs_data
	fi
	tar xvf /tmp/firmware.img -C /tmp
        if [ -d "/tmp/sysupgrade-sun8i-h2-plus-vidtoo-model-A" ]; then
                echo "upgrade kernel and rootfs"
                mtd write /tmp/sysupgrade-sun8i-h2-plus-vidtoo-model-A/kernel kernel
                mtd write /tmp/sysupgrade-sun8i-h2-plus-vidtoo-model-A/root rootfs
        else
                echo "upgrade rootfs"
                mtd write /tmp/firmware.img rootfs
        fi
}

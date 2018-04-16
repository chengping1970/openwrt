platform_check_image() {
	return 0;
}

platform_do_upgrade() {
	get_image "$@" | dd of="/dev/mtd4" bs=4096 conv=fsync
}

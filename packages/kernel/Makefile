
OPTS = ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-

get:
	git clone ${SPOND_REPOS_REF}/kernel.git src
init:
	make -C src ${OPTS} distclean
	make -C src ${OPTS} spondoolies_defconfig
	make -C src ${OPTS} -j8

build:
	make -C src ${OPTS} menuconfig
	make -C src ${OPTS} UIMAGE_NAME="SP10_FW:`cat add-ons/fs/fw_ver | tr ' ' '_'`" uImage -j 8
	make -C src ${OPTS} spondoolies.dtb

deploy:

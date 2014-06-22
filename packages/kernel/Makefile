
OPTS = ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-

get:
	git clone ${SPOND_REPOS_REF}/kernel.git src
init:
	make -C src ${OPTS} distclean
	cp kernel-config src/arch/arm/configs/spondoolies_defconfig
	make -C src ${OPTS} spondoolies_defconfig
	@rm -rf fs.cpio.lzma
	touch fs.cpio.lzma
	make -C src ${OPTS} -j8

build:

deploy:
	@rm -rf fs.cpio.lzma
	cp -frv ../buildroot/src/output/images/rootfs.cpio.lzma fs.cpio.lzma
	make -C src ${OPTS} UIMAGE_NAME="SP10_FW:`cat ${DEPLOY_DIR}/../add-ons/fs/fw_ver | tr ' ' '_'`" uImage -j 8
	make -C src ${OPTS} spondoolies.dtb

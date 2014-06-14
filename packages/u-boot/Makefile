OPTS = ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-

get:
	git clone ${SPOND_REPOS_REF}/u-boot.git src

init:
	make -C src ${OPTS} distclean
	make -C src ${OPTS} am335x_evm_config

build:
	make -C src

deploy:

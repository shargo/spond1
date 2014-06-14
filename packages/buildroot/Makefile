get:
	tar xf buildroot-2013.05.tar.xz
	mv buildroot-2013.05 src

init:
	cp buildroot-2013.05-spondoolies.bbb src/.config
	touch tools/customize-rootfs.sh
	touch tools/lzma-compress.sh
	chmod +x tools/*
	make -C src

build:
deploy:
	rm -rf tools/customize-rootfs.sh tools/lzma-compress.sh
	ln -s ${PWD}/tools/customize-rootfs-real.sh tools/customize-rootfs.sh
	ln -s ${PWD}/tools/lzma-compress-real.sh tools/lzma-compress-rootfs.sh
	make -S src

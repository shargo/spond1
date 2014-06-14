get:
	wget -O - http://download.gna.org/cryptodev-linux/cryptodev-linux-1.6.tar.gz | tar xz
	mv  cryptodev-linux-1.6 src
init:
	cp Makefile.vladik src/Makefile

build:
	cd src && make -C ../../kernel/src/  ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- SUBDIRS=${CURDIR}/src modules

deploy:

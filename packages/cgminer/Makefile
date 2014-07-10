BUILDROOT_DIR = ${CURDIR}/../buildroot/src
BUILDROOT_BUILD_DIR = ${BUILDROOT_DIR}/output/build

get:
	git clone https://github.com/Spondoolies-Tech/cgminer.git src

init:
	cd src && autoreconf -vif && ./configure --with-curses --disable-libtool-lock --enable-sp30 --host=arm-linux CC=arm-none-linux-gnueabi-gcc CFLAGS="-O3 -I${BUILDROOT_BUILD_DIR}/libcurl-7.28.1/include/ -I${BUILDROOT_BUILD_DIR}/ncurses-5.9/include/" LIBCURL_CFLAGS="-I${BUILDROOT_BUILD_DIR}/libcurl-7.28.1/include/" LIBCURL_LIBS="${BUILDROOT_BUILD_DIR}/libcurl-7.28.1/lib/.libs/libcurl.a" NCURSES_LIBS="${BUILDROOT_BUILD_DIR}/ncurses-5.9/lib/libncurses.a" LIBS="${BUILDROOT_BUILD_DIR}/ncurses-5.9/lib/libncurses.a ${BUILDROOT_BUILD_DIR}/openssl-1.0.1e/libssl.a ${BUILDROOT_BUILD_DIR}/openssl-1.0.1e/libcrypto.a -L${BUILDROOT_BUILD_DIR}/zlib-1.2.7 -lz -ldl"

build:
	make -C src -j 4
deploy:

#cp cgminer ~/shared/cgminer

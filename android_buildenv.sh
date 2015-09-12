#!/bin/sh
NDK="/usr/opt/android-ndk-r10e-linux-x86_64"
CC_DIR="$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin"
SYSROOT="$NDK/platforms/android-21/arch-arm"

CROSS_COMPILE="$CC_DIR/arm-linux-androideabi-"
CC="${CROSS_COMPILE}gcc"
CXX="${CROSS_COMPILE}g++"
LD="${CROSS_COMPILE}ld"

LIBNL="/home/chris/iw_android/prefix/lib"
INCNL="/home/chris/iw_android/prefix/include/libnl3"

CFLAGS="-Os -ggdb -fPIE --sysroot=$SYSROOT"
CXXFLAGS="$CFLAGS"
CPPFLAGS="--sysroot=$SYSROOT -I$INCNL"
LDFLAGS="--sysroot=$SYSROOT -L$LIBNL -pie"

export CC CXX LD CPPFLAGS CFLAGS CXXFLAGS LDFLAGS
exec "$@"


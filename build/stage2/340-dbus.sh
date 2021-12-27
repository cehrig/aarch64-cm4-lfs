#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/dbus-1.13.18.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress dbus-1.13.18.tar.xz &&
  tar xf dbus-1.13.18.tar &&
  cd dbus-1.13.18 &&
  mkdir build &&
  cd build &&
  EXPAT_CFLAGS="-I${LFS_STAGE_1_CROSS_TOOLS}/include" EXPAT_LIBS="-lexpat" ../configure  \
  --host=${LFS_TARGET}                                        \
  --build=${LFS_HOST}                                         \
  --prefix=/usr                       \
  --sysconfdir=/etc                   \
  --localstatedir=/var                \
  --disable-static                    \
  --disable-doxygen-docs              \
  --disable-xml-docs                  \
  --docdir=/usr/share/doc/dbus-1.12.16 \
  --with-console-auth-dir=/run/console    &&
  make LDFLAGS="-L/home/lfs/stage1/cross-tools/lib" &&
  make DESTDIR=${LFS} install'
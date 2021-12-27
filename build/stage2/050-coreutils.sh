#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/coreutils-9.0.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress coreutils-9.0.tar.xz &&
  tar xfv coreutils-9.0.tar &&
  cd coreutils-9.0 &&
  mkdir build &&
  cd build &&
  ../configure --prefix=/usr                 \
    --build=${LFS_HOST}                      \
    --host=${LFS_TARGET}                     \
    --enable-install-program=hostname        \
    --enable-no-install-program=kill,uptime &&
  make &&
  make DESTDIR=${LFS} install &&
  mv -v $LFS/usr/bin/chroot ${LFS}/usr/sbin
  mkdir -pv ${LFS}/usr/share/man/man8
  mv -v ${LFS}/usr/share/man/man1/chroot.1 ${LFS}/usr/share/man/man8/chroot.8
  sed -i "s/"1"/"8"/" ${LFS}/usr/share/man/man8/chroot.8'
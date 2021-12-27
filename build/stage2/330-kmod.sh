#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/kmod-29.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress kmod-29.tar.xz &&
  tar xf kmod-29.tar &&
  cd kmod-29 &&
  ./configure  \
  --host=${LFS_TARGET}                                        \
  --build=${LFS_HOST}                                         \
  --prefix=/usr              \
  --bindir=/bin              \
  --sysconfdir=/etc          \
  --with-rootlibdir=/lib    &&
  sed -i -e "s, install-exec-hook, ," Makefile &&
  make &&
  make DESTDIR=${LFS} install &&
  for target in depmod insmod lsmod modinfo modprobe rmmod; do
    ln -sfv /usr/bin/kmod ${LFS}/sbin/$target
  done'
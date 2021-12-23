#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/eudev-3.2.10.tar.gz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  tar xf eudev-3.2.10.tar.gz &&
  cd eudev-3.2.10 &&
  mkdir build &&
  cd build &&
  ../configure \
    --host=${LFS_TARGET}                                    \
    --build=${LFS_HOST}                                     \
    --prefix=/usr           \
    --bindir=/usr/sbin      \
    --sysconfdir=/etc       \
    --enable-manpages       \
    --disable-static &&
  make &&
  make DESTDIR=${LFS} install'
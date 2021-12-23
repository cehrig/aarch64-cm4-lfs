#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/xz-5.2.5.tar.gz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  tar xfv xz-5.2.5.tar.gz &&
  cd xz-5.2.5 &&
  mkdir build &&
  cd build &&
  ../configure --prefix=/usr        \
    --host=${LFS_TARGET}            \
    --build=${LFS_HOST}             \
    --disable-static                \
    --docdir=/usr/share/doc/xz-5.2.5 &&
  make &&
  make DESTDIR=${LFS} install'
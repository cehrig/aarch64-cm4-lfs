#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/findutils-4.8.0.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress findutils-4.8.0.tar.xz &&
  tar xfv findutils-4.8.0.tar &&
  cd findutils-4.8.0 &&
  mkdir build &&
  cd build &&
  ../configure --prefix=/usr               \
    --localstatedir=/var/lib/locate        \
    --host=${LFS_TARGET}                   \
    --build=${LFS_HOST} &&
  make &&
  make DESTDIR=${LFS} install'
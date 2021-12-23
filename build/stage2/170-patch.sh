#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/patch-2.7.6.tar.gz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  tar xfv patch-2.7.6.tar.gz &&
  cd patch-2.7.6 &&
  mkdir build &&
  cd build &&
  ../configure --prefix=/usr        \
    --host=${LFS_TARGET}            \
    --build=${LFS_HOST} &&
  make &&
  make DESTDIR=${LFS} install'
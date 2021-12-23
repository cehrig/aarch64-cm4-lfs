#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/sed-4.8.tar.gz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  tar xfv sed-4.8.tar.gz &&
  cd sed-4.8 &&
  mkdir build &&
  cd build &&
  ../configure --prefix=/usr        \
    --host=${LFS_TARGET}            \
    --build=${LFS_HOST} &&
  make &&
  make DESTDIR=${LFS} install'
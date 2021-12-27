#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/bash-5.1.8.tar.gz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  tar xfv bash-5.1.8.tar.gz &&
  cd bash-5.1.8 &&
  mkdir build &&
  cd build &&
  ../configure --prefix=/usr        \
    --build=${LFS_HOST}             \
    --host=${LFS_TARGET}            \
    --without-bash-malloc &&
  make &&
  make DESTDIR=${LFS} install &&
  ln -sfv bash ${LFS}/bin/sh'
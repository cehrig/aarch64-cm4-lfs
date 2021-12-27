#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/file-5.41.tar.gz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  tar xfv file-5.41.tar.gz &&
  cd file-5.41 &&
  mkdir build &&
  cd build &&
  ../configure --prefix=${LFS_STAGE_1_CROSS_TOOLS}/usr &&
  make &&
  make install'
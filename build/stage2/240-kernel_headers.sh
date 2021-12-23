#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/linux-5.14.15.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress linux-5.14.15.tar.xz &&
  tar xf linux-5.14.15.tar &&
  cd linux-5.14.15 &&
  make mrproper &&
  make ARCH=${LFS_ARCH} headers_check &&
  make ARCH=${LFS_ARCH} INSTALL_HDR_PATH=${LFS}/usr headers_install'
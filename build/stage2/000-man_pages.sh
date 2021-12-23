#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/man-pages-5.13.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress man-pages-5.13.tar.xz &&
  tar xfv man-pages-5.13.tar &&
  cd man-pages-5.13 &&
  make prefix=${LFS}/usr install'
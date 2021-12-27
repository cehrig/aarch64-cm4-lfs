#!/bin/bash

cleanup_work

cp /usr/bin/qemu-aarch64-static "$LFS"/usr/bin/

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/gcc-11.2.0.tar.xz ${LFS_STAGE_1_WORK} && \
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress gcc-11.2.0.tar.xz &&
  tar xf gcc-11.2.0.tar &&
  cd gcc-11.2.0 &&
  cat gcc/limitx.h gcc/glimits.h gcc/limity.h > ${LFS}/lib/gcc/aarch64-unkonwn-linux-gnu/11.2.0/install-tools/include/limits.h'

chroot "$LFS" qemu-aarch64-static /bin/bash -c '/usr/libexec/gcc/aarch64-unkonwn-linux-gnu/11.2.0/install-tools/mkheaders'
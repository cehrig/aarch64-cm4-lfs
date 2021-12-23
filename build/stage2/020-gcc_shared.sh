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
  # mpfr
  cp ${LFS_STAGE_1_SOURCES}/mpfr-4.1.0.tar.xz . &&
  tar xf mpfr-4.1.0.tar.xz &&
  mv mpfr-4.1.0 mpfr &&
  # gmp
  cp ${LFS_STAGE_1_SOURCES}/gmp-6.2.1.tar.xz . &&
  tar xf gmp-6.2.1.tar.xz &&
  mv gmp-6.2.1 gmp &&
  # mpc
  cp ${LFS_STAGE_1_SOURCES}/mpc-1.2.1.tar.gz . &&
  tar xf mpc-1.2.1.tar.gz &&
  mv mpc-1.2.1 mpc &&
  mkdir build &&
  cd build &&
  ../configure                             \
    --build=${LFS_HOST}                    \
    --host=${LFS_TARGET}                   \
    --prefix=/usr                          \
    CC_FOR_TARGET=${LFS_TARGET}-gcc        \
    --disable-nls                          \
    --disable-multilib                     \
    --disable-libstdcxx                    \
    --enable-languages=c,c++ &&            \
  make &&
  make DESTDIR=${LFS} install &&
  cd ${LFS_STAGE_1_WORK}/gcc-11.2.0 &&
  cat gcc/limitx.h gcc/glimits.h gcc/limity.h > ${LFS}/lib/gcc/aarch64-unkonwn-linux-gnu/11.2.0/install-tools/include/limits.h'

chroot "$LFS" qemu-aarch64-static /bin/bash -c '/usr/libexec/gcc/aarch64-unkonwn-linux-gnu/11.2.0/install-tools/mkheaders'
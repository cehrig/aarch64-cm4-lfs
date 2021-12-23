#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/gcc-11.2.0.tar.xz ${LFS_STAGE_1_WORK} &&
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
  ../libstdc++-v3/configure                                  \
    --build=${LFS_HOST}                                      \
    --host=${LFS_TARGET}                                     \
    --target=${LFS_TARGET}                                   \
    --prefix=${LFS_STAGE_1_CROSS_TOOLS}/${LFS_TARGET}        \
    --disable-multilib                                       \
    --disable-nls                                            \
    --disable-libstdcxx-pch                                  \
    --with-gxx-include-dir=${LFS_STAGE_1_CROSS_TOOLS}/${LFS_TARGET}/include/c++/11.2.0 &&
  make &&
  make install'
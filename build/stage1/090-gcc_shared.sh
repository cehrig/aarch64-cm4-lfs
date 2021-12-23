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
  patch -p0 < <(printf -- "--- libsanitizer/asan/asan_linux.cpp    2021-10-31 14:34:39.744838199 +0100\n+++ libsanitizer/asan/asan_linux.cpp.limits     2021-10-31 14:34:15.888370902 +0100\n@@ -31,7 +31,7 @@\n #include <sys/types.h>\n #include <dlfcn.h>\n #include <fcntl.h>\n-#include <limits.h>\n+#include <linux/limits.h>\n #include <pthread.h>\n #include <stdio.h>\n #include <unistd.h>") &&
  mkdir build &&
  cd build &&
  ../configure                                 \
    --build=${LFS_HOST}                        \
    --host=${LFS_HOST}                         \
    --target=${LFS_TARGET}                     \
    --prefix=${LFS_STAGE_1_CROSS_TOOLS}        \
    --disable-nls                              \
    --enable-languages=c,c++                   \
    --enable-c99                               \
    --enable-long-long                         \
    --disable-libmudflap                       \
    --disable-multilib  &&                     \
  make &&
  make install &&
  cd ${LFS_STAGE_1_WORK}/gcc-11.2.0 &&
  cat gcc/limitx.h gcc/glimits.h gcc/limity.h > $(dirname $(${LFS_TARGET}-gcc -print-libgcc-file-name))/install-tools/include/limits.h &&
  ${LFS_STAGE_1_CROSS_TOOLS}/libexec/gcc/${LFS_TARGET}/11.2.0/install-tools/mkheaders'
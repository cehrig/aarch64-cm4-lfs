#/bin/bash

# general setup
. stage1/000-create_user.sh
. stage1/010-sysroot_directories.sh
. stage1/020-cross_directories.sh
. stage1/030-download_sources.sh

# build
. stage1/040-kernel_headers.sh
. stage1/050-binutils.sh
. stage1/060-gcc_static.sh
. stage1/070-glibc.sh
. stage1/080-libstdc++.sh
. stage1/090-gcc_shared.sh
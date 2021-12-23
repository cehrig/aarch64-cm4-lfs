#!/bin/bash

export LFS_USER=lfs
export LFS_HOME=/home/lfs
export LFS=$LFS_HOME/system
export LFS_STAGE1=$LFS_HOME/stage1

export LFS_FLOAT=hard
# aarch64 should use fpu by default
#LFS_FPU=vfpv4
export LFS_TARGET=aarch64-unkonwn-linux-gnu
export LFS_HOST=${MACHTYPE}
export LFS_ARCH=arm64
export LFS_ARM_ARCH=aarch64

# stage 1 setup
export LFS_STAGE_1_TOOLS=$LFS_STAGE1/tools
export LFS_STAGE_1_CROSS_TOOLS=$LFS_STAGE1/cross-tools
export LFS_STAGE_1_SOURCES=$LFS_STAGE1/sources
export LFS_STAGE_1_WORK=$LFS_STAGE1/work
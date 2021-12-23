#!/bin/bash

# directories we are going to build the cross toolchain in
mkdir -pv "$LFS_STAGE_1_CROSS_TOOLS"/"$LFS_TARGET"/usr
mkdir -pv "$LFS_STAGE_1_TOOLS"

# directory storing source codes
mkdir -pv "$LFS_STAGE_1_SOURCES"

# directory we use for building all source code
mkdir -pv "$LFS_STAGE_1_WORK"

# LFS user will own those directories
chown -h -v -R "$LFS_USER":"$LFS_USER" "$LFS_STAGE_1_CROSS_TOOLS" "$LFS_STAGE_1_TOOLS" "$LFS_STAGE_1_SOURCES" "$LFS_STAGE_1_WORK"
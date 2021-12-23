#!/bin/bash

groupadd "$LFS_USER"
useradd -s /bin/bash -g "$LFS_USER" -m "$LFS_USER"

# Setting up custom bash profile in case we su to the LFS user
cat >> "$LFS_HOME"/.profile << EOF
set +h
umask 022

for i in \$(printenv | cut -d '=' -f 1)
do
        case "\$i" in
                PS1)
                ;;
                HOME)
                ;;
                TERM)
                ;;
                PATH)
                ;;
                *)
                unset "\$i"
                ;;
        esac

done

export LFS_USER=$LFS_USER
export LFS_HOME=$LFS_HOME
export LFS=$LFS
export LFS_HOST=$LFS_HOST
export LFS_TARGET=$LFS_TARGET
export LFS_ARCH=$LFS_ARCH
export LFS_ARM_ARCH=$LFS_ARM_ARCH

# not needed later on
export LFS_STAGE_1_TOOLS=$LFS_STAGE_1_TOOLS
export LFS_STAGE_1_CROSS_TOOLS=$LFS_STAGE_1_CROSS_TOOLS
export LFS_STAGE_1_SOURCES=$LFS_STAGE_1_SOURCES
export LFS_STAGE_1_WORK=$LFS_STAGE_1_WORK

export LC_ALL=POSIX

export CONFIG_SITE=$LFS/usr/share/config.site
export MAKEFLAGS='-j8'
export PATH=$LFS_STAGE_1_CROSS_TOOLS/bin:$PATH


EOF
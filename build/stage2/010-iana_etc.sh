#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/iana-etc-20211019.tar.gz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  tar xfv iana-etc-20211019.tar.gz &&
  cd iana-etc-20211019 &&
  cp services protocols ${LFS}/etc'
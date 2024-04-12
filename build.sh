#!/bin/bash -e
# Copyright © 2022-2025 Arm China Co. Ltd. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

# find release files
MINIPKG_TAR_GZ=`ls | sort -r | grep -m 1 "Compass_MiniPkg.*tar.gz"`
if [ ! -f "${MINIPKG_TAR_GZ}" ]; then
    echo "Cannot find file Compass_MiniPkg_xxx.tar.gz, please download it from https://aijishu.com/a/1060000000215443"
    exit 1
fi
export MINIPKG_PATH=$(basename $MINIPKG_TAR_GZ .tar.gz)

if [ ! -d "Compass_Unified_Parser" ]; then
    echo "Cannot find repository Compass_Unified_Parser, please download it"
    exit 1
fi

if [ ! -d "Compass_Optimizer" ]; then
    echo "Cannot find repository Compass_Optimizer, please download it"
    exit 1
fi

rm -rf ${MINIPKG_PATH} # clean last build
tar -xzvf ${MINIPKG_TAR_GZ}

cd ${MINIPKG_PATH}/AIPUBuilder/python/src/AIPUBuilder

# link your Parser
ls ../../../../../Compass_Unified_Parser/AIPUBuilder/Parser # check exist
ln -sf ../../../../../Compass_Unified_Parser/AIPUBuilder/Parser

# link your Optimizer
ls ../../../../../Compass_Optimizer/AIPUBuilder/Optimizer # check exist
ln -sf ../../../../../Compass_Optimizer/AIPUBuilder/Optimizer
cd -

# Test AIPUBuilder avaliable
export PYTHONPATH=`pwd`/${MINIPKG_PATH}/AIPUBuilder/python/src:${PYTHONPATH}
echo "Building AIPUBuilder under:"
python3 -c "import AIPUBuilder;print(AIPUBuilder.__file__)"

# build
python3 setup.py bdist_wheel

echo "Build done, your Python wheel package:"
ls -alh dist

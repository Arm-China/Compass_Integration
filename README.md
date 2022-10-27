# Compass Integration

This project builds a distribution package from `Compass_Unified_Parser` and `Compass_MiniPkg`.

## Perpare

1. You need clone [repositories](https://github.com/Arm-China) under this directory.

```bash
git clone https://github.com/Arm-China/Compass_Unified_Parser.git
```

2. You need download `minpackage` from <https://aijishu.com/a/1060000000215443> under this directory. For detailed download steps, please refer to the post.

> The `minpackage` is a tarball file named Compass_MiniPkg-x.x.x-Linux.tar.gz

## Requirements


### Hardware

Compass Integration project work on ``Linux x86_64`` only

### Software

* python = 3.8
* pip
* setuptools
* wheel

> See ./setup.py for details of python packages

## Build

```bash
./build.sh
```

The `build.sh` script will build a **python wheel file** under "./dist" directory

## Install

```bash
pip3 install dist/AIPUBuilder-*-cp38-cp38-linux_x86_64.whl
# Tips: using `pip3 install --user` or `pip3 install --target /YOUR_PATH` if your don't have root premission

# if using --user, don't forget:
export PATH="/home/${USER}/.local/bin":$PATH

# Set env
MINIPKG_PATH=`realpath ./Compass_MiniPkg-Release-*-Linux`
export PATH=${MINIPKG_PATH}/simulator/bin:${PATH}
export LD_LIBRARY_PATH=${MINIPKG_PATH}/simulator/lib:${LD_LIBRARY_PATH}
export PATH=${MINIPKG_PATH}/tool-chain/compiler/bin:${PATH}
export PATH=${MINIPKG_PATH}/tool-chain/debugger/bin:${PATH}
```

## Test

After installed, run the ./test.sh script check all modules work.

```bash
./test.sh
```

## Document

See /doc directory inside Compass_MiniPkg

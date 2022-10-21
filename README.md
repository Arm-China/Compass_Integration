# Compass Integration

This project builds a distribution package from `Compass_Unified_Parser` and `Compass_MiniPkg`.

## Perpare

You need [Clone](armchina/somewhere) repositories under this directory.

```bash
git clone Compass_Unified_Parser.... TODO: add url
```

You need [Download](armchina/somewhere) minpackage under this directory.

```bash
wget Compass_MiniPkg-x.x.x-Linux.tar.gz TODO: add url
```

## Requirements

### Hardware

Compass Integration project work on ``Linux x86_64`` only

### Software

* python = 3.8

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

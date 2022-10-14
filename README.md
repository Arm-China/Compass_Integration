# Compass Integration Note

## Status

> Compass integration is now in development mode.

## Perpare

You need [Clone](armchina/somewhere) repositories under this directory.

```bash
git clone Compass_Unified_Parser.... TODO: add which url?
```

You need [Download](armchina/somewhere) minpackage under this directory.

```bash
wget Compass_MiniPkg-0.1.1-Linux.tar.gz TODO: add which url?
```

## Requirements

### Hardware

Compass Integration project work on ``Linux-amd64`` only

### Software

* python = 3.8

> See ./setup.py for details of python packages

## Build

The `build.sh` script will build a [python wheel file]() under dist folder

```bash
./build.sh
```

## Install

```bash
pip3 install dist/AIPUBuilder-*-cp38-cp38-linux_x86_64.whl
# Tips: using pip3 install --user or --target /YOUR_PATH if your don't have root premission

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

After install, run the ./test.sh script check all modules work.

```
./test.sh
```

## Document

inside MINIPKG_PATH/Doc

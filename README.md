# Compass Integration Note

## Status

> Compass integration is now in development mode.

## Perpare

You need [Clone](armchina/somewhere) repositories under this directory.

```bash
git clone Compass_Unified_Parser.... TODO: add which url?
```

You need [download](armchina/somewhere) minpackage under this.

```bash
wget Compass_MiniPkg-0.1.1-Linux.tar.gz TODO: add which url?
```

## Requirements

### Hardware

Compass Integration project work on ``Linux-amd64`` only

### Software

* python == 3.8.5

## Build

The `build.sh` script will build a [python wheel file]() under dist folder

```bash
./build.sh
```

## Install

```bash
pip3 install dist/AIPUBuilder-.*-cp38-cp38-linux_x86_64.whl
```

> TIP: using pip3 install --user or --target /YOUR_PATH if your don't have root premission

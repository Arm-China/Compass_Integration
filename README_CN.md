# Compass Integration

本项目用于构建可发布的软件包，软件内容来自 `Compass_Unified_Parser` 仓库 `Compass_Optimizer` 仓库 和 `Compass_MiniPkg` 。

## 准备事项

你需要从 [github] 或者 [gitee] clone 以下 repositories 至仓库根目录。

[github]: https://github.com/Arm-China
[gitee]: https://gitee.com/Arm-China

```bash
git clone https://github.com/Arm-China/Compass_Unified_Parser.git
git clone https://github.com/Arm-China/Compass_Optimizer.git
```

你需要下载 `minpackage` 至仓库根目录，下载步骤请参考文章 <https://aijishu.com/a/1060000000215443> 。

> minpackage 是一个文件名为 Compass_MiniPkg-Release-xxxxx-Linux.tar.gz 的 tarball 文件。如果发现下载的文件名格式对不上，例如 1290841044-6422c77963ac7.tar.gz。请自行重命名为帖子中原来的文件名。

## 依赖项

### 硬件

Compass Integration 项目只能在 `Linux x86_64` 上构建。

### 软件

* python = 3.10
* pip
* setuptools
* wheel

更详细的 Python 依赖请查看 ./setup.py。

## 构建

```bash
./build.sh
```

脚本 build.sh 会在 ./dist 目录构建一个 python wheel 文件。

## 安装

```bash
pip3 install dist/AIPUBuilder-*-cp38-cp38-linux_x86_64.whl
# 提示: 如果没有 root 权限，请使用 `pip3 install --user` 或者 `pip3 install --target /YOUR_PATH` 命令

# 如果使用了 --user 选项，不要忘了:
export PATH="/home/${USER}/.local/bin":$PATH

# 设置环境变量
MINIPKG_PATH=`realpath ./Compass_MiniPkg-Release-*-Linux`
export PATH=${MINIPKG_PATH}/simulator/bin:${PATH}
export LD_LIBRARY_PATH=${MINIPKG_PATH}/simulator/lib:${LD_LIBRARY_PATH}
export PATH=${MINIPKG_PATH}/tool-chain/compiler/bin:${PATH}
export PATH=${MINIPKG_PATH}/tool-chain/debugger/bin:${PATH}
```

## 测试

安装成功之后, 执行 ./test.sh 脚本可以检查所有模块是否正常工作。这个脚本仅仅测试了 aipucc, aipu_simulator 和 aipubuild 工具的可用性。如果需要使用其他独立模块 (IDE, simulator, toolchain) 的完整功能，请根据对应的文档进行配置。
例如，aipucc 依赖以下运行环境:

* libpthread.so.0
* libz.so.1
* libtinfo.so.5
* ... (完整的环境依赖见文档：minipkg/aipu-toolchain)

```bash
./test.sh
```

## 文档

文档放在 Compass_MiniPkg 的 /doc 目录下。

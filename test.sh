#!/bin/bash -e

echo "checking software exist..."
echo "simulator"
aipu_simulator_x1 -v
echo "compiler"
aipucc --version
echo "buildtool"
# aipubuild --version

echo "testing out of box example..."
cd Compass_MiniPkg-Release-*-Linux/out-of-box-example/resnet_50
run.sh
cd -

echo "done, all test passed"

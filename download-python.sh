#!/bin/bash
release_date="20241016"
cpython_version="3.12.7"

arch=`uname -m`
# Convert arch to aarch64 to match the build artifact name
if [ $arch = "arm64" ]; then
    arch="aarch64"
fi

filename="cpython-${cpython_version}+${release_date}-${arch}-apple-darwin-install_only.tar.gz"

standalone_python="python/"

if [ ! -d "$standalone_python" ]; then
    wget https://github.com/indygreg/python-build-standalone/releases/download/${release_date}/${filename}
    tar -xzvf ${filename}                                                                          
    rm -rf ${filename}
    # Now delete the test/ folder, saving about 23MB of disk space
    rm -rf python/lib/python3.9/test
fi

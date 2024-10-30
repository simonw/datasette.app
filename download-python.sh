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

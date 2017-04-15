#!/bin/bash

# build libtorrent
wget https://github.com/arvidn/libtorrent/releases/download/libtorrent-1_1_3/libtorrent-rasterbar-1.1.3.tar.gz
mkdir -p libtorrent-rasterbar && tar xf libtorrent-rasterbar-1.1.3.tar.gz -C libtorrent-rasterbar/ --strip-components=1
cd libtorrent-rasterbar/
mkdir -p build
./configure --prefix=$PWD/build/
make -j4
make install
tar zcf libtorrent-rasterbar.tar.gz $PWD/build

SSH_ARGS="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
SSH_KEY="ezio.pem"

if [ ! -f "$SSH_KEY" ]; then
	SSH_KEY="tests/$SSH_KEY"
fi

# ssh to ezio.kojuro.date and run script
scp -i $SSH_KEY $SSH_ARGS libbtorrent-rasterbar.tar.gz "ezio@ezio.kojuro.date:~/"

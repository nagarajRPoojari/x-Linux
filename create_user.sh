#!/bin/bash

[ ! -e /etc/bash.bashrc ] || sudo mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE

sudo groupadd lfs
sudo useradd -s /bin/bash -g lfs -m -k /dev/null lfs
echo -e "lfs\nlfs" | sudo passwd lfs

cp -rf *.sh  *.txt Chapter* /home/lfs/

sudo su - lfs
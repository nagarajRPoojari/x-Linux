#!/bin/bash

#./version-check.sh

echo "$?"
#[ "$?" == "1" ]; exit 1 || rm -f a.out


sudo apt install binutils bison gawk gcc m4 make patch texinfo build-essential -y

export LFS=/mnt/LFS
export LFS_TGT=x86_64-kawsar-linux-gnu
export LFS_DISK=/dev/sdb

if ! grep -q "$LFS" /proc/mounts; then
    source setupdisk.sh "$LFS_DISK"
    sudo mkdir -pv "$LFS"
    sudo mount "${LFS_DISK}2" "$LFS"
    sudo chown -v nagaraj "$LFS"
fi

mkdir -pv $LFS/sources
chmod -v a+wt $LFS/sources
mkdir -pv $LFS/tools
mkdir -pv $LFS/{etc,var,boot} $LFS/usr/{bin,lib,sbin}

chown -v nagaraj $LFS/{usr{,/*},var,etc,tools}

for i in bin lib sbin; do
    sudo ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
 x86_64) mkdir -pv $LFS/lib64 ;;
esac

cp -rf *.sh md5sums wget-list Chapter* $LFS/sources
cd "$LFS/sources"
export PATH="$LFS/tools/bin:$PATH"

#source $LFS/sources/download.sh

#CPU Core
export MAKEFLAGS='-j8'


#for p in binutils gcc linux glibc; do
#    source packageinstall.sh 5 ${p}
#done

#pushd "$LFS/sources/gcc"
#source $LFS/sources/Chapter5/libstc.sh
#popd

#for p in m4 ncurses bash coreutils diffutils file findutils gawk grep gzip make patch sed tar xz binutils gcc; do
#    source packageinstall.sh 6 ${p}
#done


chmod ugo+x preparechroot.sh
chmod ugo+x insidechroot.sh
chmod ugo+x insidechroot2.sh
chmod ugo+x teardownchroot.sh
sudo ./preparechroot.sh "$LFS"


for script in "/sources/insidechroot.sh" "/sources/insidechroot2.sh" "/sources/insidechroot3.sh"; do
	echo "RUNNING $script IN CHROOT!"
	sleep 3
	sudo chroot "$LFS" /usr/bin/env \
		HOME=/root \
     		TERM="$TERM" \
     		PS1='(lfs chroot) \u:\w\$ ' \
     		PATH=/bin:/usr/bin:/sbin:/usr/sbin \
     		TESTERUID=$UID \
     		/bin/bash --login +h -c "$script"
done

sudo ./teardownchroot.sh "$LFS" "$USER" "$(id -gn)"

./configure --prefix=/usr
make
make -k check

make install

rm -fv /usr/lib/libltdl.a
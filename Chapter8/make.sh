./configure --prefix=/usr
make

chown -Rv tester .
su tester -c "PATH=$PATH make check"

make install
sed -i 's/extras//' Makefile.in
./configure --prefix=/usr


make

chown -Rv tester .
su tester -c "PATH=$PATH make check"
make LN='ln -f' install
ln -sv gawk.1 /usr/share/man/man1/awk.1

mkdir -pv                                   /usr/share/doc/gawk-5.2.2
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.2.2
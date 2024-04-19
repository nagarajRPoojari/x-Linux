
export LFS=""

cd /sources/

for package in  man-pages tcl expect dejagnu iana-etc glibc zlib bzip2 xz zstd file readline \
	m4 bc flex binutils gmp mpfr mpc attr acl libcap shadow gcc pkgconf ncurses sed psmisc \
	gettext bison grep bash libtool gdbm gperf expat inetutils  perl xml-parser intltool autoconf \
	automake kmod libelf libffi openssl python ninja meson coreutils check diffutils gawk findutils \
	grof grub less gzip iproute2 kbd libpipeline make patch man-db tar texinfo vim ;do
	
	./packageinstall 8 $package
done

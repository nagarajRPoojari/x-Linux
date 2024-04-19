cd /tmp
grub-mkrescue --output=grub-img.iso
xorriso -as cdrecord -v dev=/dev/cdrw blank=as_needed grub-img.iso

grub-install /dev/sda

cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod part_gpt
insmod ext2
set root=(hd0,2)

menuentry "GNU/Linux, Linux 6.7.4-lfs-12.1" {
        linux   /boot/vmlinuz-6.7.4-lfs-12.1 root=/dev/sda2 ro
}
EOF
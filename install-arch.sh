# Assume partitions made and mounted in /mnt directory
# mkfs.ext2 /dev/sda1
# mkswap /dev/sda2
# mkfs.ext3 /dev/sda3
# mount /dev/sda3 /mnt
# swapon /dev/sda2
# mkdir /mnt/boot
# mount /dev/sda1 /mnt/boot
# cd /mnt
pacstrap /mnt base
genfstab -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt
echo archlinux > /etc/hostname
ln -sf /usr/share/zoneinfo/zone/subzone /etc/localtime
locale-gen
mkinitcpio -p linux
echo "Type in your password"
passwd
pacman -S grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
reboot

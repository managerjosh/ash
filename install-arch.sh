# Assume partitions made and mounted in /mnt directory
# mkfs.ext2 /dev/sda1
# mkswap /dev/sda2
# mkfs.ext3 /dev/sda3
# mount /dev/sda3 /mnt
# swapon /dev/sda2
# mkdir /mnt/boot
# mount /dev/sda1 /mnt/boot
# cd /mnt
# pacstrap /mnt base
# genfstab -p /mnt >> /mnt/etc/fstab
# cp -r /etc/resolv.conf /mnt/etc/resolv.conf
# arch-chroot /mnt
# pacman -S git
echo archlinux > /etc/hostname
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
locale-gen
mkinitcpio -p linux
echo "Type in your password"
passwd
pacman -S grub -y
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
cp -r /etc/resolv.conf /mnt/etc/resolv.conf
exit
reboot

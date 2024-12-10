#!/bin/bash

# Formatting partitions
mkfs.fat -F32 -n "UEFI" /dev/nvme0n1p1
mkswap -L "SWAP" /dev/nvme0n1p2
swapon /dev/nvme0n1p2
mkfs.ext4 -L "Arch" /dev/nvme0n1p3

# Mounting
mount /dev/nvme0n1p3 /mnt/
mkdir -p /mnt/boot/efi/
mount /dev/nvme0n1p1 /mnt/bot/efi/

# Installing basics
pacstrap /mnt base base-devel neovim linux-zen linux-zen-headers linux-firmware mkinitcpio xf86-input-libinput

genfstab -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

arch-chroot /mnt

nvim /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

pacman -Sy

ln -sf /usr/share/zoneinfo/America/Bogota /etc/localtime
hwclock -w

echo KEYMAP=us > /etc/vconsole.conf

echo HyprLinux > /etc/hostname
echo  127.0.0.1     localhost

  ::1           localhost

  127.0.1.1     HyprLinux.localdomain HyprLinux

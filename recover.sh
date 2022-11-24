#!/bin/bash

# setup the /mnt environment
echo "Setting up the /mnt environment"
mkdir -p /mnt/boot/efi
echo "mkdir -p /mnt/boot/efi"
mkdir /mnt/home
echo "mkdir /mnt/home"
mkdir /mnt/var
echo "mkdir /mnt/var"
mkdir /mnt/snapshots
echo "mkdir /mnt/snapshots"
mkdir /mnt/var
echo"mkdir /mnt/var"
mkdir /mnt/swap
echo"mkdir /mnt/swap"

# unlock crypted volume
echo "Unlocking encrypted volumes"
cryptsetup open /dev/sda3 linux
cryptsetup open /dev/sda4 home
ls /dev/mapper/

# mount the btrfs subvol
echo "Mounting BTRFS Subvolumes"
mount -t btrfs -o subvol=@ /dev/mapper/linux /mnt
mount -t btrfs -o subvol=@snapshots /dev/mapper/linux /mnt/snapshots
mount -t btrfs -o subvol=@swap /dev/mapper/linux /mnt/swap
mount -t btrfs -o subvol=@var /dev/mapper/linux /mnt/var
mount -t btrfs -o subvol=@home /dev/mapper/home /mnt/home

# mount boot partitions
echo "Mounting boot partitions"
mount /dev/sda2 /mnt/boot
mount /dev/sda1 /mnt/boot/efi

# chroot
echo "Entering chroot environment"
cd /
arch-chroot /mnt

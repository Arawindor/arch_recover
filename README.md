# Arch recover script
A simple bash script to unlock btrfs encrypted volumes, mount them and arch-chroot in.

## Requirements
Volumes partitions, type, encryption and mount destinations:
    /dev/sda1 (vfat) > /boot/efi
    /dev/sda2 (ext4) > /boot
    /dev/sda3 (btrfs encrypted) --> /dev/mapper/linux --> @ > /mnt
                                                  --> @snapshots > /mnt/snapshots
                                                  --> @swap > /mnt/swap
                                                  --> @var > /mnt/var
    /dev/sda4 (btrfs encrypted) --> /dev/mapper/home  --> @home > /mnt/home

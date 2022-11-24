# Arch recover script
A simple bash script to unlock btrfs encrypted volumes, mount them and arch-chroot in.

## Requirements
Volumes partitions, type, encryption and mount destinations:

    /dev/sda1 (vfat) mounted in /boot/efi
    /dev/sda2 (ext4) mounted in /boot
    /dev/sda3 (btrfs encrypted) --> /dev/mapper/linux --> @ mounted in /mnt
                                                  --> @snapshots mounted in /mnt/snapshots
                                                  --> @swap mounted in /mnt/swap
                                                  --> @var mounted in /mnt/var
    /dev/sda4 (btrfs encrypted) --> /dev/mapper/home  --> @home mounted in /mnt/home

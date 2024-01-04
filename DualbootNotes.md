# JEOrg Cloud Test Drives  - DualBoot Notes

## Preface

This document is intended to be used as a reminder of the challenges one can face when trying to install an `encrypted` system with `Windows` and `Ubuntu` installed as separate operating systems

## Preparations

Before starting to make any installation make sure to have a couple of empty pen drives ready to use:

1. With FAT32 will be needed to install [VeraCrypt](https://www.veracrypt.fr/code/VeraCrypt/) recovery disk
2. An empty pen-drive potentially needed to install [gparted](https://gparted.org/) recovery disk.
3. With the Live-Boot latest ubuntu version
4. With the paid Windows 11 (at least the Home edition)
5. Any USB pen drive that the BIOS can read. This one will be needed to carry the needed drivers.

## BitLocker, Disk Encryption and LVM, ZFS

BitLocker is available in all paid versions of Windows except that in the Home edition, it is only called `Disk Encryption`.
The reason for this seems to be the fact that with `Disk Encryption` the options are more limited. `LVM` and `ZFS` are filesystems supported by ubuntu where we can use encryption.

The above ways to encrypt a disk are, however not valid for what we need because we want to encrypt partitions and not the whole disk.
Furthermore, `BitLocker` conflicts with `LVM` and `ZFS` because apparently `GRUB` masks `TMP2` needed by BitLocker to operate, making a simultaneous presence impossible.

## The Partition encryption solution


#### 1. Windows installation

In windows, we can use [VeraCrypt](https://www.veracrypt.fr/code/VeraCrypt/ to encrypt partitions and `VeraCryp` only works if the installed volume is installed in the same device where the system boots from. This makes it necessary that Windows is the first system that needs to be installed.

Before installing windows make sure to have these drivers for your computer on a `USB stick`:
1. Drivers to read the `HDD` that should preferably be `SSD's`
2. Drivers for the `wireless` connection. Sure, we can always use a cable but that is not very handy.

Open the BIOS and make sure that the secure boot is on. Windows will not allow any installation without the secure boot turned on.

Once this is all ready start the installation. If you have an out of the ordinary computer (which could be a sign of a great computer), windows will probably not detect the presence of the `HDD's` nor will it detect the presence of the `WLAN` board.
There will be an option to load the drivers into the setup. Use that option to load the drivers and then the `HDD's` should be listed.

Make sure to delete everything you find. Ideally you should have 2 different disks purely because it makes it easier to select what goes into windows and what goes into ubuntu.
Either way the best thing to do is to even out the size of the two partitions. Leave one empty to be use in Ubuntu later on and select another one for Windows.

After installation look for the option `Disk Encryption` and immediately deactivate it. We do NOT want `BitLocker` in this case. We will use VeraCrypt instead.

When that is completed, install VeraCrypt and proceed to encrypt the `System Partition`.

Once that is done, the windows installation is complete and the partition is encrypted.

#### 2. Ubuntu installation

Start the system with the live Ubuntu disk and run the install programmer. Go through the easy-to-follow steps until you reach the `HHD's` choices.
Choose the option `Something else`.

The following process is extremely manual but it is also quite simple. We need 3 partitions at least for Ubuntu and we make them from the empty partition.
These are the ones we need:

1. `/boot` -  an ext4 file system of around 50Gb. This can increase if you are using many cores.
2. `EFI` - make a partition of around 20Gb. This is just a size that worked for me.
3. `/` aka `root` - a reserved for encryption file system with the remaining size. Here you need to select your password.

If everything goes well, you should have an encrypted partition with `LUKS` that gets automatically chosen for you.

#### 3. GRUB

Grub will be installed on the Ubuntu partition/disk. Choose that as a priority partition during boot on the BIOS so that you get the option to choose between `Windows` and `Ubuntu` everytime you run your computer.


## Extra notes

This installation was very difficult to achieve and it took a long time to succeed in this.
If you have questions about this document feel free to open issues about this in this repo.
I hope I have helped you.


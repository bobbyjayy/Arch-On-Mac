# Installation
My rundown on installing Arch on my Macbook Air 2013

## Partition the disk on MacOs
The first step is to partition the disk using disk utility on MacOs. The file
format does not matter because the partition will be formatted when going
through the installation of Arch(*so choose whatever ie. Mac Os Extended or Fat*) and choose your size.

## Bootloader(rEFInd)
Since MacOs already has an EFI partition to boot up the OS(You can check it by
using `diskutil list` and it will list the partitions), I decided to use rEFInd
to find and boot up Arch. Plus it has a nice interface that you can configure.
You can check out the website about rEFInd and how to install it [here](http://www.rodsbooks.com/refind/).
After downloading rEFInd, install using the rEFInd-install script mentioned on
the install page of the website. MacOs requires system integrity protection to
be disabled before running the script.

Note
>I used the refind-install script on MacOs to install rEFInd and used the same script on Arch after installation. I will mention that process later on.

### Some useful commands for MacOs
```
diskutil list
diskutil mount EFI (mounts efi to /Volumes/ so you can mess with the efi partition if needed)
```

## Create USB 
I used the **dd** command to format the usb for istallation. You have to umount
the usb first before running the command. Check `diskutil list` to see where the
usb is mounted. MAKE SURE YOU DO NOT RUN **dd** ON OTHER PARTITIONS OR YOU WILL
ERASE EVERYTHING.

`dd if=/directory/to/arch.iso of=/dev/nameoftheusbdevice(usually sdxx)`

**if** stands for input file. It is used to specify the location of the ISO file.
**of** stands for output file. It specifies where to write the ISO file.

## Installing Arch
Restart MacOs, plug in the usb and hold the *option* key to load up the usb.
So follow the [Arch wiki guide](https://wiki.archlinux.org/index.php/Installation_guide), but skip the part about **partitioning the disk**
since that is already done. So continue to **formatting the partitions**, skip the
part about **Boot Loader**.

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

Note
>I used the refind-install script on MacOs to install rEFInd and used the same script on Arch after installation. I will mention that process later on.

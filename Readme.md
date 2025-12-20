# r/Techsupport Bootable Diagnostics and Recovery

This media was created to assist users trying to rescue their systems and data. It contains the tools required to recover files, check network issues, and manipulate or verify disks and their health.

This is build is for Bullseye (11).

See `config\package-lists\` for included packages.

## Build
This process has been containerized and put into a DevOps pipeline requiring `podman` and `buildah`. The pipeline will produce an ISO based on the files contained in `/config`.

### Local build
Ensure you have docker installed. If running Windows, it is highly recommended to clone the repository to a Linux environment, such as [WSL](https://learn.microsoft.com/en-us/windows/wsl/install).

Within the Docker Desktop app, head to Resources > WSL Integration and `Enable integration with additional distros` and turn on the toggle switch for the distro you are using. Note: You do not need to manually install Docker within the WSL Linux environment separately, docker will provide this automatically.

Test if Docker works by running `docker --version` in the shell.

Compile and run the build with the following commands:
```sh
docker build -t rts-debian .
docker run --rm --privileged -v "$(pwd):/repo" rts-debian
```

#### Common issues:
* Errors were encountered while processing X package - Manually pull the Debian for docker directly by running `docker pull debian:trixie`.
* Removing build files - The following command will remove everything excess from the build toolchain as per .gitignore (Including the ISO, so make sure you back it up elsewhere for testing!): `sudo git clean -Xdf`

## Tools list
### basics
* curl
* wget
* mousepad
* firefox-esr

### efi
* [efibootmgr](https://wiki.archlinux.org/title/EFISTUB#efibootmgr)

### disk tools
* [gparted](https://rtech.support/docs/disks/gparted)
* [smartmontools](https://rtech.support/docs/disks/disk-health.html#smartmontools)
* [gsmartcontrol](https://rtech.support/docs/disks/disk-health.html#gsmartcontrol-gui-method)
* [nwipe](https://rtech.support/docs/disks/disk-wipe.html)
* [hdparm](https://ata.wiki.kernel.org/index.php/ATA_Secure_Erase)
* ntfs-3g
* hfsprogs
* [nvme-cli](https://rtech.support/docs/disks/disk-wipe.html#nvme-ssd)
* mdadm

### files
* p7zip-full

### net tools
* dnsutils
* traceroute
* gnome-nettool
* wireshark-gtk

### encryption
* cryptsetup
* dislocker

### recovery tools
* [testdisk](https://rtech.support/docs/disks/data-recovery/testdisk.html)
* gddrescue
* clonezilla

### hardware
* usbutils
* pciutils
* hardinfo

#### A note on sudo in podman and --privileged
It is required for the `chroot` stage of livebuild. See https://github.com/containers/podman/issues/4619

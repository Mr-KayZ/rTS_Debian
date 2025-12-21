# Key idea for project:
---
- Add packages for testing CPU, GPU and Memory
- Potentially other testing tools for testing other hardware?
- Add step by step in the DE so that the user won't have to resort to going to the wiki for everything, especially if they don't have internet access (maybe create a PDF collection of the wiki?)
    - Either a PDF, or a local session running off the image? Whenever a user opens up firefox it automatically redirects to 127.XXX.XXX to show the wiki?
    - Avoid PDFs, try creating static HTML pages of the important parts of the rts debian install. ALso test ALL tools properly and update wiki explaining what each tool does before doing this!
- Add links in folders for different catagories of stuff like a folder called "Hardware testing", "Disk tools", etc.
    - Create scripts or bash scripts for ease of use for users, so all users have to enter are values and it will just run the program directly
    - Also for memtest86+ create a bash script to reboot via grub (both memtest86+ (legacy) and memtest86+-efi)

# Manual list
---
## Hardware testing:
- stress-ng - Comprehensive hardware validation - ADD
    - May replace simple stress and sysbench as this is for serious hardware validation
- fio - Disk I/O benchmarking

## Advanced hardware testing
- inxi - Comprehensive hardware info (may be useful)

## Recovery
- safecopy - Alternative to ddrescue for damaged media - Better for severly damaged media, such as drive has loads of bad areas

## Windows recovery
- hivexregedit - Registry viewing/editing - Search up how to use this in thorough detail
    - Part of libguestfs-tools (not preinstalled) at 500 mb - see what other tools are there

---
## Preinstalled packages
Stress tests:
- sysbench
- stress

Disk tools:
- gparted - Partition editor
- smartmontools - SMART health monitoring
- e2fsprogs - Has far more utilities beyond just badblocks, add them as a list
- gsmartcontrol - GUI for smartmontools
- nwipe/shred - Secure erase
- hdparm - Drive configuration
- nvme-cli - NVMe management
- testdisk - Data recovery + Fixing boot drives
- gddrescue - Failing drive recovery
- clonezilla - Disk cloning/imaging
- dislocker - Read and write to MS bitlocker encrypted drives
- ntfsfix - Fix Windows and basic NTFS inconsistencies, clear dirty flags (part of ntfs-3g)

Hardware info:
- usbutils - USB device info
- pciutils - PCI device info
- hardinfo - System profiler

## Stuff added so far:
- Memtest86+ - Added via GRUB menu
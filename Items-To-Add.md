# Key idea for project:
---
- Add packages for testing CPU, GPU and Memory
- Potentially other testing tools for testing other hardware?
- Add step by step in the DE so that the user won't have to resort to going to the wiki for everything, especially if they don't have internet access (maybe create a PDF collection of the wiki?)
    - Either a PDF, or a local session running off the image? Whenever a user opens up firefox it automatically redirects to 127.XXX.XXX to show the wiki?

# Manual list
---
## Hardware testing:
- memtest86+ - RAM testing via GRUB menu
- stress-ng - CPU and memory testing
- mprime - CPU stability testing
- badblocks - Potentially in e2fsprogs, surface scan tool for drives
- fio - Disk I/O benchmarking

## Advanced hardware testing
- stress - System stress testing
- bonnie++ - Filesystem and disk benchmarking
- iotop - Disk I/O monitoring
- inxi - Comprehensive hardware info (may be useful)

## Other disk tools
- ddrescue - Maybe be present in gddrescue for failing drives
- safecopy - Alternative to ddrescue for damaged media
- TestDisk - Partition recovery software, alternative to ddrescue and safecopy perhaps?
- shred - Secure file deletion (should be part of coreutils)
- scrub - Pattern-based disk wiping
- dislocker - Read and write to MS bitlocker encrypted drives

## Windows recovery
- hivexregedit - Registry viewing/editing - Search up how to use this in thorough detail
- ntfsfix - Fix Windows and basic NTFS inconsistencies, clear dirty flags
- ms-sys - Boot sector repair, write to Windows MBR or VBR partitions

## Remove 
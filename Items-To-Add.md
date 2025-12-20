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
- sysbench - Already preinstalled? Used for stability testing
- badblocks - Surface scan tool for drives
    - Already part of e2fsprogs - preinstalled?
- fio - Disk I/O benchmarking

## Advanced hardware testing
- stress - System stress testing
- bonnie++ - Filesystem and disk benchmarking
- iotop - Disk I/O monitoring
- inxi - Comprehensive hardware info (may be useful)

## Other disk tools
- ddrescue - Maybe be present in gddrescue for failing drives
- safecopy - Alternative to ddrescue for damaged media
- TestDisk - Partition recovery software, alternative to ddrescue and safecopy perhaps? Can also maybe fix boot drives via rebuildbs
- shred - Secure file deletion (should be part of coreutils)
- scrub - Pattern-based disk wiping
- dislocker - Read and write to MS bitlocker encrypted drives

## Windows recovery
- hivexregedit - Registry viewing/editing - Search up how to use this in thorough detail
    - Part of libguestfs-tools (not preinstalled) at 500 mb - see what other tools are there
- ntfsfix - Fix Windows and basic NTFS inconsistencies, clear dirty flags
    - Part of the ntfs-3g package
- ms-sys - Boot sector repair, write to Windows MBR or VBR partitions - Do we really need this?

---
## Preinstalled packages
- e2fsprogs - Has the following:
    - badblocks
- sysbench
- stress
- gddrescue
- testdisk
- coreutils
    - shred
- dislocker
- ntfs-3g
    - ntfsfix
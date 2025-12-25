# Key idea for project:
---
- Add step by step in the DE so that the user won't have to resort to going to the wiki for everything, especially if they don't have internet access (maybe create a PDF collection of the wiki?) - Too difficult, maybe a potential future upgrade idea?
    - Either a PDF, or a local session running off the image? Whenever a user opens up firefox it automatically redirects to 127.XXX.XXX to show the wiki?
    - Avoid PDFs, try creating static HTML pages of the important parts of the rts debian install. ALso test ALL tools properly and update wiki explaining what each tool does before doing this!
- Add links in folders for different catagories of stuff like a folder called "Hardware testing", "Disk tools", etc.
    - Create scripts or bash scripts for ease of use for users, so all users have to enter are values and it will just run the program directly
    - Also for memtest86+ create a bash script to reboot via grub (both memtest86+ (legacy) and memtest86+-efi)

---
## Issues:

### Terminal shortcut error: Untrusted application launcher
The desktop file "xfce4-terminal.desktop" is in an insecure location and
not marked as secure/executable. If you do not trust this program, click
Cancel.

Exec=xfce4-terminal

---
## Items to add:
- GPU tester

---
## Add bash scripts
- Add bash scripts for different monitor sizes as well just in case. Call it "Change display resolution".
    - Also add common display resolutions:
        - 3840x2160
        - 2560x1440
        - 1920x1080
        - 1366x768 (for older laptops)
- Add bash scripts for all other tools (See Readme.md)
    - Potentially create a guide to easily follow within the terminal.
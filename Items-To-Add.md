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
---
## Add bash scripts
- Add bash scripts for all other tools (See Readme.md)
    - Potentially create a guide to easily follow within the terminal.

## NOTE:
For stress tests, especially with the bash script, also add an automatic logging option via glances and lm-sensors so that others can go over logs and see exact details about the thing, especially if anything seems broken or wrong.

# An example of how to permanently mount an additional drive (UUID) to a particular location (`/mnt/DATA`)

```
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sdb3 during installation
UUID=d6c328c2-705d-4348-9de2-e710cc8d8d06 /               ext4    errors=remount-ro 0       1
# swap was on /dev/sdb5 during installation
UUID=89d2d220-bc65-439a-b80a-c53fbd48f356 none            swap    sw              0       0
UUID=b22af8ae-6b30-4209-9346-b08a408fa7b7 /mnt/DATA ext4 defaults 0 2
```

1. sudo fallocate -l 10Gib -o 1024 /mnt/ArchVM
2. sudo modprobe loop
3. sudo losetup --partscan /dev/loop5 /mnt/ArchVM
4. sudo cfdisk /dev/loop5
5. sudo mkfs.ext4 /dev/loop5p1
6. sudo mkdir /mnt/Virtual
7. sudo mount /dev/loop5p1 /mnt/Virtual
8. sudo rsync -aAXv /* /mnt/Virtual --exclude={dev,home,lost+found,mnt,media,proc,run,sys,tmp}

# Resources

https://docs.kernel.org/
https://kernelnewbies.org/
https://elixir.bootlin.com/linux/v7.0.1/source
https://wiki.qemu.org/Documentation/9psetup

# Steps to create the kernel

Build kernel with 
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y

Also enable virtio for P9


Follow https://github.com/bluedragon1221/minlinux2


Add this to fstab:
hostmods /host  9p  trans=virtio,version=9p2000.L   0   0

Set this instead of the default login 
console::respawn:/bin/sh

Run with

qemu-system-x86_64 \
  -kernel bzImage \
  -initrd init.cpio \
  -nographic \
  -append "console=ttyS0" \
  -virtfs local,mount_tag="hostmods",path="/home/neosahadeo/Documents/Projects/C/kernel/testenv/modules/",security_model=none

# Kernel Module Developement

A collection of resources and such as I learn how to write
kernel modules.

## Resources

- https://docs.kernel.org/
- https://kernelnewbies.org/
- https://elixir.bootlin.com/linux/v7.0.1/source
- https://wiki.qemu.org/Documentation/9psetup

## Steps to create the kernel

Follow https://github.com/bluedragon1221/minlinux2

Build kernel with for console output
```
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
```

Also enable virtio for P9


## Generating the RAMFS for QEMU

Add this to `fstab`:
hostmods /host  9p  trans=virtio,version=9p2000.L   0   0

Set this instead of the default login in `inittab`:
console::respawn:/bin/sh

Create a host directory to live mount modules

## Running

Mv the kernel image to the test directory. Generate the cpio
file with

```
pushd initfiles
find . | cpio -o -H newc --owner=+0:+0 > ../init.cpio
popd
```

Run with qemu. Outputs directly to the terminal.

```
qemu-system-x86_64 \
  -kernel bzImage \
  -initrd init.cpio \
  -nographic \
  -append "console=ttyS0" \
  -virtfs local,mount_tag="hostmods",path="PATH_HERE",security_model=none
```

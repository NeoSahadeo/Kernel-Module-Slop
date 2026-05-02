#!/bin/bash

qemu-system-x86_64 \
  -kernel bzImage \
  -initrd init.cpio \
  -nographic \
  -append "console=ttyS0" \
  -virtfs local,mount_tag="hostmods",path="/home/neosahadeo/Documents/Projects/C/kernel/testenv/modules/",security_model=none

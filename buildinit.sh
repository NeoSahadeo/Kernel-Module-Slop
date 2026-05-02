#!/bin/bash

pushd initfiles
find . | cpio -o -H newc --owner=+0:+0 > ../init.cpio
popd

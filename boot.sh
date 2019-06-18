#!/bin/bash

QVER=v4.0.0
KVER=v5.1
RVER=2019.05

./qemu/$QVER/bin/qemu-system-riscv64 -M virt -m 1024M -smp 4 -no-reboot -nographic \
	-kernel kernel/v5.1/fw_jump.elf \
	-device loader,file=kernel/$KVER/Image,addr=0x80200000 \
	-initrd root/$RVER/rootfs.cpio.gz \
	-append 'route=172.17.0.5 root=/dev/ram0  sharetag=hostshare sharedir=/hostshare console=ttyS0' \
	#-net nic,model=virtio -net tap -device virtio-net-device,netdev=net0,mac=70:b7:a1:52:f4:28 -netdev tap,id=net0


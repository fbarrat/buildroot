set -x

qemu-system-ppc64 -m 1G -M pseries,x-vof=on,accel=kvm,kvm-type=HV,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off \
		  -smp 1 \
		  -kernel /tests/vmlinux  \
		  -initrd /tests/rootfs.minimal.cpio \
		  -append 'console=hvc0' \
		  -nodefaults -serial mon:stdio

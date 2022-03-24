#!/bin/sh

RC=$(grep -q "debugfs" ${TARGET_DIR}/etc/fstab)
if (($?)) ; then
    echo "debugfs /sys/kernel/debug/ debugfs defaults 0 0" >> ${TARGET_DIR}/etc/fstab
fi

# Copy buildroot kernel to the overlay directory so that we have a
# kernel in the image for qemu. And remove the unneccesary modules to
# keep the initram small.
TEST_DIR=${TARGET_DIR}/tests
mkdir -p $TEST_DIR
cp ${BUILD_DIR}/linux*/vmlinux $TEST_DIR/
rm -rf ${TARGET_DIR}/lib/modules

chmod +x $TEST_DIR/qemu-pseries.sh


cp ~/bin/lsprop  ${TARGET_DIR}/usr/bin/

exit 0

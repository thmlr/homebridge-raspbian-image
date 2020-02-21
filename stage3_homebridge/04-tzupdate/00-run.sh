#!/bin/bash -e

#
# Install the tzupdate service to update the timezone on boot
#

install -m 644 files/tzupdate.service "${ROOTFS_DIR}/etc/systemd/system/"

on_chroot << EOF
sudo pip install 'tzupdate==1.5.0'

systemctl daemon-reload
systemctl enable tzupdate
EOF

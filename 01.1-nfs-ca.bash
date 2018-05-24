#!/usr/bin/env bash

source ./common.bash

# Install nfs-kernel-server

apt -y install nfs-kernel-server


# Export KUBERNETES_CERT_DIR
cat <<EOF >/etc/exports
$KUBERNETES_CERT_DIR     $CONTROLLER2_HOSTNAME(ro,sync,no_subtree_check)
EOF

# Restart NFS service

systemctl restart nfs-server

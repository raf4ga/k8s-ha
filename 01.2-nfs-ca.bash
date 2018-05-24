#!/usr/bin/env bash

source ./common.bash

# Create folder for storing keys, we will use /etc/kubernetes/pki (based on examples like Kubeadm)

mkdir -p "$KUBERNETES_CERT_DIR"

# Install nfs-common package

apt -y install nfs-common

# Import permanently CA files

cat <<EOF >>/etc/fstab
$CONTROLLER_PRIVATE_IP:$KUBERNETES_CERT_DIR $KUBERNETES_CERT_DIR nfs auto,nofail,noatime 0 0
EOF

echo "Mounting $KUBERNETES_CERT_DIR"

mount $KUBERNETES_CERT_DIR

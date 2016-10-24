#!/bin/bash

PRIVATE_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
sed -i "s/{{PRIVATE_IP}}/$PRIVATE_IP/g" /etc-kubernetes-manifests/kube-apiserver.yaml

mkdir -p /etc/kubernetes/manifests
cp -r /etc-kubernetes-manifests/* /etc/kubernetes/manifests

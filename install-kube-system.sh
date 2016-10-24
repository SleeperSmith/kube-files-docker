#!/bin/bash

#usage -> docker run --rm --net host <container> install-kube-system.sh

/usr/bin/curl  -H "Content-Type: application/yaml" -XPOST \
-d"$(cat /srv-kubernetes-manifests/kube-dns-rc.yaml)" \
"http://127.0.0.1:8080/api/v1/namespaces/kube-system/replicationcontrollers"

/usr/bin/curl  -H "Content-Type: application/yaml" -XPOST \
-d"$(cat /srv-kubernetes-manifests/kube-dashboard-rc.yaml)" \
"http://127.0.0.1:8080/api/v1/namespaces/kube-system/replicationcontrollers"

/usr/bin/curl  -H "Content-Type: application/yaml" -XPOST \
-d"$(cat /srv-kubernetes-manifests/heapster-de.yaml)" \
"http://127.0.0.1:8080/apis/extensions/v1beta1/namespaces/kube-system/deployments"

for manifest in {kube-dns,heapster,kube-dashboard}-svc.yaml;do
  /usr/bin/curl  -H "Content-Type: application/yaml" -XPOST \
  -d"$(cat /srv-kubernetes-manifests/$manifest)" \
  "http://127.0.0.1:8080/api/v1/namespaces/kube-system/services"
done
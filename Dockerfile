FROM ubuntu:14.04.5

RUN apt-get update && apt-get install -y curl awscli

ADD etc-kubernetes-manifests /etc-kubernetes-manifests/
ADD srv-kubernetes-manifests /srv-kubernetes-manifests/
ADD etc-kubernetes-cni /etc-kubernetes-cni/
ADD opt-bin /opt-bin/
ADD copy-kube-configs.sh /
ADD install-kube-system.sh /

RUN chmod +x ./copy-kube-configs.sh
RUN chmod +x ./install-kube-system.sh
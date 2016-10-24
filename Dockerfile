FROM ubuntu:14.04.5

RUN apt-get update && apt-get install -y curl awscli
ADD etc-kubernetes-manifests /etc-kubernetes-manifests/
ADD srv-kubernetes-manifests /srv-kubernetes-manifests/
ADD etc-kubernetes-cni /etc-kubernetes-cni/
ADD opt-bin /opt-bin/
ADD init.sh /
RUN chmod +x ./init.sh

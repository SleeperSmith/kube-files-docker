FROM ubuntu:14.04.5

ADD etc-kubernetes-manifests /etc-kubernetes-manifests/
ADD srv-kubernetes-manifests /srv-kubernetes-manifests/
ADD etc-kubernetes-cni /etc-kubernetes-cni/
ADD opt-bin /opt-bin/
ADD init.sh /

CMD ["init.sh"]
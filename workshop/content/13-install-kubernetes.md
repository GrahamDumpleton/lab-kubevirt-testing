
```terminal:execute-all
command: dnf -y install kubernetes-kubeadm kubernetes-node kubernetes-client
```

```terminal:execute-all
command: sed -i -e 's%KUBELET_ADDRESS="--address=127.0.0.1"%KUBELET_ADDRESS="--address=0.0.0.0"%' /etc/kubernetes/kubelet
```

```terminal:execute-all
command: sed -i -e 's%# *KUBELET_PORT="--port=10250"%KUBELET_PORT="--port=10250"%' /etc/kubernetes/kubelet
```

```terminal:execute-all
command: sed -i -e 's%KUBELET_HOSTNAME="--hostname-override=127.0.0.1"%KUBELET_HOSTNAME="--hostname-override=master.{{session_namespace}}.svc.cluster.local"%' /etc/kubernetes/kubelet
```

```terminal:execute-all
command: sed -i -e 's%Environment="KUBELET_DNS_ARGS=--cluster-dns=\(.*\) --cluster-domain=cluster.local"%Environment="KUBELET_DNS_ARGS=--cluster-dns=\1 --cluster-domain=session.local"%' /etc/systemd/system/kubelet.service.d/kubeadm.conf
```

```terminal:execute-all
command: sed -i -e 's%Environment="KUBELET_EXTRA_ARGS=--cgroup-driver=systemd"%Environment="KUBELET_EXTRA_ARGS=--cgroup-driver=systemd --container-runtime=remote --container-runtime-endpoint=unix:///var/run/crio/crio.sock"%' /etc/systemd/system/kubelet.service.d/kubeadm.conf
```

```terminal:execute-all
command: systemctl enable kubelet
```

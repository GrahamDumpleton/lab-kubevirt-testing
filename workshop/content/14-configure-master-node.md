{% include 'vars.liquid' %}

```terminal:execute
command: kubeadm config images pull
session: 1
```

```terminal:execute
command: kubeadm init --control-plane-endpoint={{ MASTER_CLUSTER_IP }} --pod-network-cidr=10.64.0.0/16 --cri-socket=unix:///var/run/crio/crio.sock
session: 1
```

```
Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

You can now join any number of control-plane nodes by copying certificate authorities
and service account keys on each node and then running the following as root:

  kubeadm join 10.96.25.118:6443 --token 6r20oe.95o2a057p2njf7dp \
        --discovery-token-ca-cert-hash sha256:4e31ac28e8d6a9eee625715bf24e93afce315dc7bedfcb7222bff6fce9e53c5e \
        --control-plane 

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 10.96.25.118:6443 --token 6r20oe.95o2a057p2njf7dp \
        --discovery-token-ca-cert-hash sha256:4e31ac28e8d6a9eee625715bf24e93afce315dc7bedfcb7222bff6fce9e53c5e
```

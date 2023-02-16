Before we can get started we need to wait for the virtual machines for the nodes
to start.

```examiner:execute-test
name: check-node-is-ready
prefix: KubeVirt
title: "Checking master node is ready"
args:
- master
timeout: 5
retries: .INF
delay: 1
autostart: true
```

```examiner:execute-test
name: check-node-is-ready
prefix: KubeVirt
title: "Checking worker node #1 is ready"
args:
- node01
timeout: 5
retries: .INF
delay: 1
autostart: true
```

```examiner:execute-test
name: check-node-is-ready
prefix: KubeVirt
title: "Checking worker node #2 is ready"
args:
- node02
timeout: 5
retries: .INF
delay: 1
autostart: true
```

In this workshop environment the virtual machines for the nodes are being
created and managed using KubeVirt. The virtual machines are therefore running
in the same Kubernetes cluster which this workshop environment is running.

You can get a list of the virtual machine instances which have been created for
this workshop session by running:

```terminal:execute
command: kubectl get virtualmachineinstances
```

This should generate output similar to:

```
NAME     AGE     PHASE     IP            NODENAME                 READY
master   60s     Running   10.244.0.100  educates-control-plane   True
node01   60s     Running   10.244.0.101  educates-control-plane   True
node02   60s     Running   10.244.0.102  educates-control-plane   True
```

Note that although each virtual machine instance has an IP address associated
with it, and they are reachable using those IP addresses, the virtual machine
instances managed by KubeVirt behave in a similar way to pods in a Kubernetes
cluster. That is, if the virtual machine instance is shutdown and restarted, it
will be given a different IP address.

For this reason, to ensure that each node is contactable using a fixed
unchanging IP address, we have also created Kubernetes services for each node.
The corresponding services can be listed by running:

```terminal:execute
command: kubectl get services
```

The output should be similar to:

```
NAME     TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                          AGE
master   ClusterIP   10.96.4.238     <none>        22/TCP,6443/TCP,80/TCP,443/TCP   1m30s
node01   ClusterIP   10.96.151.242   <none>        22/TCP,6443/TCP,80/TCP,443/TCP   1m30s
node02   ClusterIP   10.96.96.211    <none>        22/TCP,6443/TCP,80/TCP,443/TCP   1m30s
```

It is the cluster IP for each of these services which we will be later using
when setting up the Kubernetes cluster.

If the virtual machine instances are showing as ready, you can proceed with the
workshop.

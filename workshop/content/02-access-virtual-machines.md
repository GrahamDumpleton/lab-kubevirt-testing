{% include 'vars.liquid' %}

In addition to the Kubernetes service providing us with a fixed IP for each
virtual machine, it also provides us with a hostname we can use to access each
node. The hostnames you can use to access the nodes from the workshop terminal
for this session are as follows. The nodes are not accessible from outside of
the workshop environment.

* **Master Node**: `master.{{session_namespace}}.svc.cluster.local`{{copy}} ({`{{MASTER_CLUSTER_IP}}`{{copy}})
* **Worker Node #1**: `node01.{{session_namespace}}.svc.cluster.local`{{copy}} (`{{NODE01_CLUSTER_IP}}`{{copy}})
* **Worker Node #2**: `node02.{{session_namespace}}.svc.cluster.local`{{copy}} (`{{NODE02_CLUSTER_IP}}`{{copy}}

Login to each node in a separate workshop terminal.

```terminal:execute
command: ssh fedora@master.{{session_namespace}}.svc.cluster.local
session: 1
clear: true
```

```terminal:execute
command: ssh fedora@node01.{{session_namespace}}.svc.cluster.local
session: 2
clear: true
```

```terminal:execute
command: ssh fedora@node02.{{session_namespace}}.svc.cluster.local
session: 3
clear: true
```

We need to be the `root` user on each of the nodes to make changes so use
`sudo` to create a shell running as `root`.

```terminal:execute-all
command: exec sudo -s
```

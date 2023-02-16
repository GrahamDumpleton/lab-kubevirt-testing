Wait for all the nodes to reboot.

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

Login again to each node in a separate workshop terminal.

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

Create a shell running as the `root` user.

```terminal:execute-all
command: exec sudo -s
```

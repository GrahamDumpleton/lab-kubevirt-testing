Now that the base operating system is configured, we need to install a
container runtime.

Kubernetes supports the use of `dockerd`, `containerd` and CRI-O. For this
workshop we will use CRI-O.

To install CRI-O and require container networking plugins run:

```terminal:execute-all
command: |-
  dnf module -y install cri-o:1.24/default
  dnf -y install containernetworking-plugins
```

Enable CRI-O and start it.

```terminal:execute-all
command: systemctl enable --now crio
```

We also install some client tools for working with containers running under
CRI-O, and policies for SELinux.

```terminal:execute-all
command: dnf -y install cri-tools iproute-tc container-selinux
```

To check that CRI-O is running, run:

```terminal:execute
command: crictl info
```

The output should be:

```
{
  "status": {
    "conditions": [
      {
        "type": "RuntimeReady",
        "status": true,
        "reason": "",
        "message": ""
      },
      {
        "type": "NetworkReady",
        "status": true,
        "reason": "",
        "message": ""
      }
    ]
  }
}
```

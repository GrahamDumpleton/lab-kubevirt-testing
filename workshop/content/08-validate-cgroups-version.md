The cgroups (abbreviated from control groups) feature is implemented by the
Linux kernel and limits, accounts for, and isolates the resource usage (CPU,
memory, disk I/O, network, etc.) of a collection of processes. There are two
versions of cgroups, V1 and V2.

Understanding which version is enabled is important as Kubernetes prior to
version 1.25 only support cgroups V1.

To verify which version of cgroups is being used in Fedora Linux run:

```terminal:execute
command: stat -fc %T /sys/fs/cgroup/
```

In our case this should output `cgroup2fs` indicating cgroups V2 is being used.
If the output had been `tmpfs`, then it is cgroups V1.

In our case we will be installing a recent enough Kubernetes version, so crgoups
V2 will be okay.

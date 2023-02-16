System swap is used when the operating system runs out of memory. Any inactive
memory pages are written out to disk to free up resident memory for use by
other applications.

Because of the performance implications of system swap being enabled, this
feature would nearly always be disabled for nodes in a Kubernetes cluster.

To determine if system swap is enabled you can run:

```terminal:execute
command: swapon -s
session: 1
```

All our nodes are the same so it is enough to run this just on the master node.
The output should in this workshop environment be similar to:

```
Filename     Type       Size      Used   Priority
/dev/zram0   partition  8388604   0      100
```

That an entry is listed indicates swap is being used.

For the Fedora Linux image being used, we can disable swap by running:

```terminal:execute-all
command: touch /etc/systemd/zram-generator.conf
```

This will only take effect once the machine is rebooted. We will only do that
though after completing other setup steps.

Security-Enhanced Linux (SELinux) is a security architecture for Linux systems
that allows administrators to have more control over who can access the system.
As we are using Fedora Linux, this feature comes enabled out of the box and as
such we either need to disable it (not advised) or configure it appropriately.

Create an SELinux policy file for Kubernetes as follows.

```terminal:execute-all
command: |-
  cat > k8s.te << EOF
    module k8s 1.0;

    require {
            type cgroup_t;
            type iptables_t;
            class dir ioctl;
    }

    #============= iptables_t ==============
    allow iptables_t cgroup_t:dir ioctl;
  EOF
```

We then register the policy with SELinux.

```terminal:execute-all
command: |-
  checkmodule -m -M -o k8s.mod k8s.te
  semodule_package --outfile k8s.pp --module k8s.mod
  semodule -i k8s.pp
```

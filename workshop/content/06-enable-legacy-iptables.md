Kubernetes relies on software defined networking features to give workloads
separate IP addresses and partition networks where necessary. This is
facilitated using iptables, however there are two variants of iptables
available. These are `iptables-nft`, a newer interface for iptables, and
`legacy-iptables`. As the software defined networking software we use requires
`legacy-iptables`, we need to ensure it is the default.

For the current Fedora operating system, neither iptables package is currently
installed. To install `legacy-iptables`, along with some tools for working with
networking, run:

```terminal:execute-all
command: dnf -y install iptables-legacy ethtool ebtables
```

To verify that this variant of iptables is used run:

```terminal:execute
command: alternatives --display iptables
session: 1
```

This should output:

```
iptables - status is auto.
 link currently points to /usr/sbin/iptables-legacy
/usr/sbin/iptables-legacy - priority 10
 slave ip6tables: /usr/sbin/ip6tables-legacy
 slave iptables-restore: /usr/sbin/iptables-legacy-restore
 slave iptables-save: /usr/sbin/iptables-legacy-save
 slave ip6tables-restore: /usr/sbin/ip6tables-legacy-restore
 slave ip6tables-save: /usr/sbin/ip6tables-legacy-save
Current `best' version is /usr/sbin/iptables-legacy.
```

If this displays `auto` or references `iptables-nft`, you can force use of
`iptables-legacy` by running:

```terminal:execute-all
command: alternatives --set iptables /usr/sbin/iptables-legacy
```

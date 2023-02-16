With `legacy-iptables` support installed, we still need to set kernel
parameters for it and ensure the kernel network bridge filter and network
overlay modules are being loaded.

To configure iptables run:

```terminal:execute-all
command: |-
  cat > /etc/sysctl.d/99-k8s-cri.conf <<EOF
  net.bridge.bridge-nf-call-iptables=1
  net.ipv4.ip_forward=1
  net.bridge.bridge-nf-call-ip6tables=1
  EOF
```

To load the network bridge filter and network overlay modules run:

```terminal:execute-all
command: echo -e overlay\\nbr_netfilter > /etc/modules-load.d/k8s.conf
```

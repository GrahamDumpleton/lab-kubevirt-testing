Linux operating system images will in some cases come with a network firewall
enabled by default and it is necessary to explicitly open up the firewall to
allow access. For a node in a Kubernetes cluster we don't want any such
restrictions and so need to ensure that any network firewall is disabled.

For Fedora Linux the firewall can be disabled by running:

```terminal:execute-all
command: systemctl disable --now firewalld
```

In our case the firewall software is not even installed and so we should see
the message:

```
Failed to disable unit: Unit file firewalld.service does not exist.
```

Otherwise the installed firewall software would have been disabled.

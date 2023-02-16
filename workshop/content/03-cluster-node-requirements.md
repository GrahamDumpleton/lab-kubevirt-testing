Instructions for using `kubeadm` to install a Kubernetes cluster can be found in
the [Kubernetes documentation](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/).
General requirements are given as:

* One or more machines running a deb/rpm-compatible Linux OS; for example: Ubuntu or CentOS.
* 2 GiB or more of RAM per machine -- any less leaves little room for your apps.
* At least 2 CPUs on the machine that you use as a control-plane node.
* Full network connectivity among all machines in the cluster. You can use either a public or a private network.

In reality there is a lot more to it than that, and what you may need to do to
prepare any machines will also depend on the variant of the Linux operating
system you are using. Not all requirements and the steps you need to take are
clearly laid out in the Kubernetes documentation, so you may find it necessary
to refer to posts from others who have setup a cluster on the specific Linux
operating system variant you intend using.

For the Fedora Linux operating system we are using, the unique steps we need to
take to pre-configure the machines are as follows:

* Ensure that operating system swap has been disabled.
* Ensure that any system network firewall has been disabled.
* Ensure that legacy iptables support is being used.
* Configure iptables support and kernel networking.
* Validate which version of cgroups is being used.
* Ensure that systemd DNS resolver has been disabled.

* Disable or configure SELinux if its policies are enforced.

These steps need to be performed on each node and we will be running them
manually so the required steps are better understood. In practice you would use
a custom virtual machine image which has had all these and any other steps
already run. For this workshop we are using a standard Fedora Cloud base image
with no pre-configuration done.


This is a Kubernetes cheat sheet.

Official documentation: https://kubernetes.io/fr/docs/home/

Official cheat sheet: https://kubernetes.io/docs/reference/kubectl/cheatsheet/

A huge YouTube Kubernetes playlist and a huge **thank you** to the author of the playlist (this cheat sheet is mostly based on this great content):

https://www.youtube.com/playlist?list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0

- [Kubectl](#kubectl)
  * [Installation](#installation)
  * [Setup bash completion](#setup-bash-completion)
  * [Setup Krew](#setup-krew)
- [Minikube](#minikube)
- [Microk8s](#microk8s)
- [K8s with vagrant](#k8s-with-vagrant)
- [K8s using LXC Containers](#k8s-using-lxc-containers)
- [K3s](#k3s)
  * [Installation](#installation-1)
    + [Server node](#server-node)
    + [Agent node](#agent-node)
    + [Add to kubectl config](#add-to-kubectl-config)
    + [Kubernetes dashboard](#kubernetes-dashboard)
  * [Uninstall](#uninstall)
    + [Kubernetes dashboard](#kubernetes-dashboard-1)
    + [Agent node](#agent-node-1)
    + [Server node](#server-node-1)
- [K8s on bare metal](#k8s-on-bare-metal)
  * [Install with kubespray](#install-with-kubespray)
  * [Update your Ansible inventory](#update-your-ansible-inventory)
  * [Add to kubectl config](#add-to-kubectl-config-1)
  * [First connection](#first-connection)
  * [Add a worker node to the cluster](#add-a-worker-node-to-the-cluster)
  * [Remove a worker node from the cluster](#remove-a-worker-node-from-the-cluster)
  * [ClusterIP vs. NodePort](#clusterip-vs-nodeport)
  * [Kubernetes Dashboard](#kubernetes-dashboard)
  * [Upgrade Kubernetes with Kubespray](#upgrade-kubernetes-with-kubespray)
    + [Warning](#warning)
    + [Upgrading](#upgrading)
    + [Unexpected errors](#unexpected-errors)
- [Learn Kubernetes](#learn-kubernetes)
  * [Running docker containers](#running-docker-containers)
  * [Pod, replicaset and deployment](#pod--replicaset-and-deployment)
    + [Pod](#pod)
    + [Replicaset](#replicaset)
    + [Deployment](#deployment)
  * [Namespaces](#namespaces)
  * [Node Selectors](#node-selectors)
  * [Schedule a pod on a specific node](#schedule-a-pod-on-a-specific-node)
  * [PodNodeSelector Admission Control Plugin](#podnodeselector-admission-control-plugin)
  * [DaemonSets](#daemonsets)
  * [Jobs and cronjobs](#jobs-and-cronjobs)
    + [Jobs](#jobs)
    + [Cronjobs](#cronjobs)
  * [TTL Controller for Finished Resources](#ttl-controller-for-finished-resources)
  * [Init containers](#init-containers)
  * [Persistent volumes and claims](#persistent-volumes-and-claims)
    + [HostPath](#hostpath)
    + [Troubleshooting PV deletion](#troubleshooting-pv-deletion)
    + [NFS Volumes](#nfs-volumes)
  * [Getting started with Helm](#getting-started-with-helm)
    + [Installing Helm](#installing-helm)
    + [Installing Helm 2.x (deprecated)](#installing-helm-2x--deprecated-)
    + [Migrating from Helm 2.x](#migrating-from-helm-2x)
  * [Installing Jenkins in Kubernetes using Helm](#installing-jenkins-in-kubernetes-using-helm)
  * [Configuring Jenkins to connect to Kubernetes](#configuring-jenkins-to-connect-to-kubernetes)
  * [Jenkins CI CD Pipeline in Kubernetes](#jenkins-ci-cd-pipeline-in-kubernetes)
  * [Secrets](#secrets)
  * [Statefulsets](#statefulsets)
    + [Create NFS shares](#create-nfs-shares)
    + [Create PVs](#create-pvs)
    + [Create Statefulset](#create-statefulset)
  * [Dynamically provision NFS persistent volumes](#dynamically-provision-nfs-persistent-volumes)
    + [Warning](#warning-1)
    + [Install NFS server](#install-nfs-server)
    + [Install the provisioner](#install-the-provisioner)
    + [Install the provisioner with MongoDB compatible options:](#install-the-provisioner-with-mongodb-compatible-options-)
    + [Define NFS as the default storage class](#define-nfs-as-the-default-storage-class)
    + [Demo](#demo)
  * [Create a Secret based on existing Docker credentials](#create-a-secret-based-on-existing-docker-credentials)
  * [Config maps](#config-maps)
  * [Resource quotas and limits](#resource-quotas-and-limits)
    + [Limit number of pods (etc...) in a namespace](#limit-number-of-pods--etc--in-a-namespace)
    + [Limit the memory for a namespace](#limit-the-memory-for-a-namespace)
  * [Performing Rolling Updates of applications](#performing-rolling-updates-of-applications)
    + [Update](#update)
    + [Rollback](#rollback)
    + [Pausing and resume=ing a rollout](#pausing-and-resume-ing-a-rollout)
  * [Renaming nodes](#renaming-nodes)
  * [How to upgrade your Kubernetes Cluster](#how-to-upgrade-your-kubernetes-cluster)
  * [Setting up Rancher](#setting-up-rancher)
  * [Monitoring Kubernetes Cluster with Rancher](#monitoring-kubernetes-cluster-with-rancher)
  * [Kubernetes Logging with Rancher, Fluentd and Elastic Stack](#kubernetes-logging-with-rancher--fluentd-and-elastic-stack)
  * [Kubernetes alerts to Slack with Rancher](#kubernetes-alerts-to-slack-with-rancher)
  * [Set up Nginx Ingress in Kubernetes Bare Metal](#set-up-nginx-ingress-in-kubernetes-bare-metal)
    + [Install and configure HAProxy](#install-and-configure-haproxy)
    + [Remarks about NGINX Ingress Controllers](#remarks-about-nginx-ingress-controllers)
    + [Install NGINX Inc Ingress controller](#install-nginx-inc-ingress-controller)
    + [Demo of  NGINX Inc Ingress controller](#demo-of--nginx-inc-ingress-controller)
    + [Uninstall NGINX Inc Ingress controller](#uninstall-nginx-inc-ingress-controller)
  * [Install Traefik Ingress Controller](#install-traefik-ingress-controller)
    + [Install Traefik Ingress Controller v1.7](#install-traefik-ingress-controller-v17)
    + [Uninstall Traefik Ingress Controller v1.7](#uninstall-traefik-ingress-controller-v17)
  * [Install Traefik Ingress Controller v2.2, custom resource way](#install-traefik-ingress-controller-v22--custom-resource-way)
  * [Set up MetalLB Load Balancing for Bare Metal Kubernetes](#set-up-metallb-load-balancing-for-bare-metal-kubernetes)
    + [Intro](#intro)
    + [Install MetalLB](#install-metallb)
    + [Demo](#demo-1)
    + [Uninstall MetalLB](#uninstall-metallb)
  * [Using Horizontal Pod Autoscaler](#using-horizontal-pod-autoscaler)
    + [Metrics-server installation](#metrics-server-installation)
    + [Setup HPA demo](#setup-hpa-demo)
    + [Demo HPA](#demo-hpa)
  * [Pod auto-scaling based on memory utilization](#pod-auto-scaling-based-on-memory-utilization)
  * [Useful Tools - kube-ops-view and kubebox](#useful-tools---kube-ops-view-and-kubebox)
    + [kube-ops-view](#kube-ops-view)
    + [kubebox](#kubebox)
  * [Setup Let's Encrypt cert-manager in Kubernetes Bare Metal](#setup-let-s-encrypt-cert-manager-in-kubernetes-bare-metal)
    + [Install cert-manager](#install-cert-manager)
    + [cert-manager demo](#cert-manager-demo)
  * [Deploy and use Nginx ingress controller](#deploy-and-use-nginx-ingress-controller)
    + [Install Nginx ingress controller](#install-nginx-ingress-controller)
    + [Demo](#demo-2)
    + [Automatically generated self-signed certificate](#automatically-generated-self-signed-certificate)
    + [Automatically Let's Encrypt generated certificate (not working)](#automatically-let-s-encrypt-generated-certificate--not-working-)
    + [Manually install an existing Let's encrypt certificate](#manually-install-an-existing-let-s-encrypt-certificate)
  * [Ingresses](#ingresses)
  * [Pod Disruption Budget](#pod-disruption-budget)
  * [MongoDB replica set installation](#mongodb-replica-set-installation)
    + [Warning](#warning-2)
    + [Create Persistent Volumes](#create-persistent-volumes)
    + [Install the chart](#install-the-chart)
    + [Ingress](#ingress)
    + [Expose using a LoadBalancer](#expose-using-a-loadbalancer)
    + [Java driver](#java-driver)
    + [Uninstall](#uninstall-1)
    + [Conclusion](#conclusion)
    + [An alternative setup (going into details)](#an-alternative-setup--going-into-details-)
  * [Elasticsearch](#elasticsearch)
    + [Elastic Cloud on Kubernetes](#elastic-cloud-on-kubernetes)
      - [Install the Elastic Cloud Operator](#install-the-elastic-cloud-operator)
      - [Create Persistent Volumes](#create-persistent-volumes-1)
      - [Let the operator install Elasticsearch](#let-the-operator-install-elasticsearch)
      - [Expose Elasticsearch using a LoadBalancer](#expose-elasticsearch-using-a-loadbalancer)
      - [Install Kibana](#install-kibana)
      - [Install Filebeat](#install-filebeat)
      - [Uninstall](#uninstall-2)
  * [Running a private docker registry](#running-a-private-docker-registry)
    + [Install docker and docker-compose](#install-docker-and-docker-compose)
    + [Setup the server](#setup-the-server)
    + [Test the registry](#test-the-registry)
    + [Declare the server in Kubernetes](#declare-the-server-in-kubernetes)
    + [Test Kubernetes communication with registry](#test-kubernetes-communication-with-registry)
  * [Running nvidia GPU workloads](#running-nvidia-gpu-workloads)
  * [Dynamic volume provisioning with Rook and Ceph](#dynamic-volume-provisioning-with-rook-and-ceph)
    + [Install Ceph with Rook](#install-ceph-with-rook)
    + [Ceph demo](#ceph-demo)
  * [Dynamic volume provisioning with OpenEBS Mayastor](#dynamic-volume-provisioning-with-openebs-mayastor)
    + [Benchmark disks and network](#benchmark-disks-and-network)
    + [Prerequisites](#prerequisites)
    + [Deploy mayastor](#deploy-mayastor)
    + [Configure mayastor](#configure-mayastor)
    + [Deploy a test application](#deploy-a-test-application)
    + [Reducing the CPU limits of Mayastor](#reducing-the-cpu-limits-of-mayastor)
    + [Trying to get NVMe over Fabrics working](#trying-to-get-nvme-over-fabrics-working)
  * [Dynamic Local PV provisioning with OpenEBS](#dynamic-local-pv-provisioning-with-openebs)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>

# Kubectl

## Installation

Official documentation:

https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/#installer-kubectl-sur-linux

```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```
Test the installation:
```bash
kubectl version --client
```

You can download a specific version (here 1.18.3) using:
```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.3/bin/linux/amd64/kubectl
```

## Setup bash completion

Do it. It's great. I mean it.

Official documentation: https://kubernetes.io/docs/tasks/tools/install-kubectl/#enabling-shell-autocompletion

Install bash-completion:
```bash
sudo apt-get install bash-completion
type _init_completion
```
If the ``type _init_completion`` command fails, then add this line to your .bashrc:
```bash
source /usr/share/bash-completion/bash_completion
```
Source the completion script in the .bashrc:
```bash
echo 'source <(kubectl completion bash)' >>~/.bashrc
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null
```

## Setup Krew

Krew is a plugin manager for kubectl. It is optional. 

Official documentation: https://krew.sigs.k8s.io/docs/

List of plugins: https://krew.sigs.k8s.io/plugins/

Some of them seem to be nice (and/or highly starred on github):
- cert-manager: Manage cert-manager resources inside your cluster
- ctx: Switch between contexts in your kubeconfig
- ns: Switch between Kubernetes namespaces
- df-pv: Show disk usage (like unix df) for persistent volumes
- flame: Generate CPU flame graphs from pods
- graph: Visualize Kubernetes resources and relationships
- images: Show container images used in the cluster
- kubesec-scan: Scan Kubernetes resources with kubesec.io
- pexec: Execute process with privileges in a pod
- pod-lens: Show pod-related resources
- reap: Delete unused Kubernetes resources.
- tail: Stream logs from multiple pods and containers using simple, dynamic source selection.
- unused-volumes: List unused PVCs
- view-cert: View certificate information stored in secrets
- view-secret: Decode Kubernetes secrets
- view-utilization: Shows cluster cpu and memory utilization
- who-can: Shows who has RBAC permissions to access Kubernetes resources
- whoami: Show the subject that's currently authenticated as.

Make sure git is installed:
```bash
sudo apt install git
```

For Bash and ZSH shells, run:
```bash
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" &&
  tar zxvf krew.tar.gz &&
  KREW=./krew-"${OS}_${ARCH}" &&
  "$KREW" install krew
)
```

Add the $HOME/.krew/bin directory to your PATH environment variable. To do this, update your .bashrc or .zshrc file and append the following line: 
```bash
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
```
Restart your shell.

List installed plugins:
```bash
kubectl krew list
```
Search plugins:
```bash
kubectl krew search whoami
```
```text
NAME    DESCRIPTION                                         INSTALLED
whoami  Show the subject that's currently authenticated...  no
```
Install plugin:
```bash
kubectl krew install whoami
```
Use the plugin:
```bash
kubectl whoami
```
```text
kubecfg:certauth:admin
```

# Minikube

Minikube is a virtual machine containing a single-node Kubernetes cluster.

It's fine but it takes a long time to start and consumes a lot of memory (since it is a VM).

For testing purpose K3s seems to be easier and far less CPU and memory consuming.

Official Minikube install:

https://kubernetes.io/fr/docs/tasks/tools/install-minikube/


# Microk8s

TODO

Official documentation:

https://microk8s.io/docs/

Described as *The smallest, fastest, fully-conformant Kubernetes that tracks upstream releases and makes clustering trivial.*

Installation (not tested) looks easy:

```bash
sudo snap install microk8s --classic --channel=1.18/stable
```

# K8s with vagrant

It seems quite common to use vagrant to install multi-node clusters, each node running in a VM.

https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/

https://www.youtube.com/watch?v=wPdIBeWJJsg

(TODO)

# K8s using LXC Containers

https://www.youtube.com/watch?v=XQvQUE7tAsk

https://www.youtube.com/watch?v=egQyFeiDM1c

https://www.youtube.com/watch?v=Qb-sP4aM0OM

(TODO)

It might be a nice way to do since because (quoting the author): 
*... lxc profile which allows this containers to consume up to 4 GB of RAM...*

So RAM is maybe not allocated upfront like Minikube does, plus it allows multi-node clusters.

# K3s

K3s is a lightweight certified Kubernetes distribution.

It is using less CPU than K8s and memory footprint is low enough to fit in a Raspberry Pi.

https://k3s.io/

I would certainly consider K3s as an option to start with Kubernetes on a laptop because of its low resource usage 
and its trivial install/uninstall procedure. I'd like to know how it can be stopped and started, 
and I'd like to give Microk8s a try before concluding though.

## Installation 

Installation is very easy and very quick (2 minutes).

### Server node

Install with permissions to edit the config files:
```bash
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode 644" sh -
```

Once done, get the node token from:
```bash
cat /var/lib/rancher/k3s/server/node-token
```

### Agent node

Install without permissions to edit the config files (replace **server** and **token**):
```bash
curl -sfL https://get.k3s.io | K3S_URL="https://server:6443" K3S_TOKEN="token" sh -
```

### Add to kubectl config

Official doc:

https://rancher.com/docs/k3s/latest/en/cluster-access/

If you don't have any Kubectl config yet, you can simply copy the file into your ~/.kube/config file:

```bash
scp me@server:/etc/rancher/k3s/k3s.yaml ~/.kube/config
```
Otherwise display config on k3s server:
```bash
more /etc/rancher/k3s/k3s.yaml
```

It will show the admin username, admin password and certificate authority data of the cluster.

**Warning**: this is a better way to do this, described in the [Add to kubectl config](#add-to-kubectl-config) paragraph.
But the procedure below is working fine.

Then on you laptop you can run (replace **server** and **password**):
```bash
kubectl config set-cluster k3s --server=https://server:6443
kubectl config set-credentials k3s-admin --username=admin --password=password
kubectl config set-context k3s  --cluster=k3s --user=k3s-admin
kubectl config use-context k3s
```

Finally manually add certificate-authority-data in the k3s cluster section of .kube/config
```yaml
- cluster:
    server: https://vision:6443
    certificate-authority-data: base64data
  name: k3s
```

Then use the k3s context:
```bash
kubectl config use-context k3s
```

### Kubernetes dashboard

TODO 

See dashboard install procedure for K8s below, maybe it's working too.

## Uninstall

### Kubernetes dashboard

If you only want to remove the dashboard:
```bash
kubectl delete ns kubernetes-dashboard
```
### Agent node

```bash
/usr/local/bin/k3s-agent-uninstall.sh
```
### Server node

```bash
/usr/local/bin/k3s-uninstall.sh
```

# K8s on bare metal

## Install with kubespray

Official documentation:

https://kubernetes.io/docs/setup/production-environment/tools/kubespray/

According to the kubespray quick start, it seems to be a better choice to use an Ansible
installed using pip rather than installing ansible from your linux distribution packages:

https://kubespray.io/#/?id=quick-start

Maybe it should be worth trying the ansible package coming from the Linux distribution
but I haven't tried (I wanted to play safe for my first install).

For Ansible installation using Python, see: 

https://github.com/bfreuden/ansible-cheat-sheet#using-python

Make sure you're using ansible and ansible-playbook from your python env:
```bash
which ansible
which ansible-playbook
```

Make sure you're using ansible 2.6 or higher:
```bash
ansible --version
```

Configure managed machines for Ansible, see:

https://github.com/bfreuden/ansible-cheat-sheet#managed-machines

Make sure IPv4 forwarding is setup on all machines of the cluster (must return 1):

```bash
ansible all -a "sysctl net.ipv4.ip_forward"
```

If it is not the case, you can use this little playbook:
```yaml
---
- name: kubernetes install prerequisites
  hosts: all
  become: yes
  tasks:
    - name: setup IPv4 forwarding
      ansible.posix.sysctl:
        name: net.ipv4.ip_forward
        value: '1'
        sysctl_set: yes
```

Make sure firewall is disabled on the machines:

```bash
ansible all -b -a "ufw status"
```

Make sure all machines have internet access:
```bash
ansible all -a "wget --spider --quiet http://example.com"
```

Clone kubespray:
```bash
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
```

From your ansible python env, make your you're using your env's pip:
```bash
which pip
```

Then install Kubespray requirements:
```bash
pip install -r requirements.txt
```

Make sure python netaddr is installed:
```bash
pip list | grep netaddr
```

If it is not installed: 
```bash
# if you are using the ansible of your Linux distribution:
sudo apt install python-netaddr
# if you are using ansible from a python env:
pip install netaddr
```

Make sure you're using at least Jinja 2.9:
```bash
pip show jinja2
```

Copy ``inventory/sample`` as ``inventory/mycluster``
```bash
cp -rfp inventory/sample inventory/mycluster
```

Then declare IP addresses (not host names or the script will fail!) of your cluster:
```bash
declare -a IPS=(192.168.1.12 192.168.1.14 192.168.1.25)
```

Then build the inventory:
```bash
CONFIG_FILE=inventory/mycluster/hosts.yaml python contrib/inventory_builder/inventory.py ${IPS[@]}
```

Then you *certainly* want to edit the ``inventory/mycluster/hosts.yaml`` file to replace node1, node2 and node3
with actual hostnames of the machines because Kubespray will actually rename your machines to node1, node2 and node3!
It can also be useful if you want to change the roles of your machines.

You might want to have a look at the ``inventory/mycluster$ gedit group_vars/k8s-cluster/k8s-cluster.yml`` file since 
it is defining the Kubernetes configuration (like the default engine: docker or containerd). 

You might also want to have a look at the ``inventory/mycluster/group_vars/all/all.yml`` file.

And finally launch Kubespray (and go out for lunch since it takes 45 minutes):

```bash
ansible-playbook -i inventory/mycluster/hosts.yaml  --become --become-user=root cluster.yml
```
Disk usage of kubernetes is
* 2 GB on regular node
* 7 GB on nvidia node

RAM usage reported by htop is:
* 500 MB on nodes
* 800 MB on master 1
* 1 GB on master 2 (running nvidia)

CPU usage is around 15% of a core with an idle cluster.

Note that it is probably a good idea to keep your kubespray clone and its generated inventory in
a safe place for the future.

## Update your Ansible inventory

We'll keep on using using Ansible below. To prevent from having to type ``-i inventory/mycluster/hosts.yaml`` let's add 
this to our ``/etc/ansible/hosts``:
```ini
[k8s]
node1
node2
node3
```

## Add to kubectl config

Get the kube config from the master:
```bash
ansible -b node1 -m fetch -a "src=/etc/kubernetes/admin.conf flat=true dest=./"
```

If it is your first kubernetes connection, you can simply copy that file:
```bash
mkdir ~/.kube/
sudo mv admin.conf ~/.kube/config
sudo chown $USER. ~/.kube/config
``` 

If you already have a ``~/.kube/config`` file, you probably want to merge the config file of your new cluster into it:
```bash
mv ~/.kube/config ~/.kube/config.bak
export KUBECONFIG=~/.kube/config.bak:admin.conf
kubectl config view --flatten > ~/.kube/config
unset KUBECONFIG
```
Note that we are leveraging the ``KUBECONFIG`` environment variable that is containing a list of config files.
Kubetcl will virtually merge those files. The default context will be the default context of the first file.

Now you should see all contexts:
```bash
kubectl config get-contexts
```

Show the name of the newly-imported context:
```bash
kubectl --kubeconfig=admin.conf config get-contexts
```

Make that context the default one:
```bash
kubectl config use-context kubernetes-admin@cluster.local
```

## First connection

List your nodes:
```bash
kubectl get nodes
```
```text
NAME    STATUS     ROLES    AGE    VERSION
node1   NotReady   master   2d5h   v1.17.5
node2   Ready      master   2d5h   v1.17.5
node3   Ready      <none>   2d5h   v1.17.5
```

Get cluster info:
```bash
kubectl cluster-info
```
```text
Kubernetes master is running at https://192.168.1.12:6443
```

Get cluster events:
```bash
kubectl get events
```
```text
12m         Normal    NodeHasSufficientMemory   node/node2                    Node node2 status is now: NodeHasSufficientMemory
12m         Normal    NodeHasNoDiskPressure     node/node2                    Node node2 status is now: NodeHasNoDiskPressure
12m         Normal    NodeHasSufficientPID      node/node2                    Node node2 status is now: NodeHasSufficientPID
12m         Normal    NodeAllocatableEnforced   node/node2                    Updated Node Allocatable limit across pods
12m         Normal    Starting                  node/node2                    Starting kube-proxy.
12m         Normal    RegisteredNode            node/node2                    Node node2 event: Registered Node node2 in Controller
12m         Normal    Starting                  node/node3                    Starting kubelet.
etc...
```
Get Kubernetes pods:
```bash
kubectl -n kube-system get pods
```
```text
NAME                                       READY   STATUS    RESTARTS   AGE
calico-kube-controllers-7485f77d57-xljcf   1/1     Running   3          2d5h
calico-node-6n4vb                          1/1     Running   4          2d5h
etc...
```
Now let's check the network communications (``--rm`` to remove the pod when we are done):
```bash
kubectl run myshell -it --rm --image busybox -- sh
# get the IP of the myshell pod
hostname -i
# ping the IP of the  myshell2 pod
# ping n.n.n.n 
exit
```

From another terminal run a second container:
Now let's check the network communications (--rm to remove the pod when we are done):
```bash
kubectl run myshell2 -it --rm --image busybox -- sh
# get the IP of the myshell2 pod
hostname -i
# ping the IP of the  myshell pod
# ping m.m.m.m 
exit
```
If pings succeed, it means Calico network is working correctly.

From another terminal you can see the pod being created:
```bash
kubectl get pods
kubectl get pods -o wide
```

## Add a worker node to the cluster

Official documentation: https://github.com/kubernetes-sigs/kubespray/blob/master/docs/getting-started.md#adding-nodes

You're probably doing this quite some time after your first install, so remember to read the
[Install with kubespray](#install-with-kubespray) paragraph once again to make sure that:
- your new machine is ready for Ansible
- IPv4 forwarding is setup on the new machine
- your Ansible installation is always OK (Jinja version, netaddr python package...)

Open the ``inventory/mycluster/hosts.yaml`` generated during the install.
It should look like this:
```yaml
all:
  hosts:
    server1:
      ansible_host: 192.168.1.36
      ip: 192.168.1.36
      access_ip: 192.168.1.36
    server2:
      ansible_host: 192.168.1.35
      ip: 192.168.1.35
      access_ip: 192.168.1.35
    server3:
      ansible_host: 192.168.1.32
      ip: 192.168.1.32
      access_ip: 192.168.1.32
  children:
    kube-master:
      hosts:
        server1:
        server2:
    kube-node:
      hosts:
        server1:
        server2:
        server3:
    etcd:
      hosts:
        server1:
        server2:
        server3:
    k8s-cluster:
      children:
        kube-master:
        kube-node:
    calico-rr:
      hosts: {}
```
Then simply declare a new host and put it under the kube-node as well:
```yaml
all:
  hosts:
    server1:
      ansible_host: 192.168.1.36
      ip: 192.168.1.36
      access_ip: 192.168.1.36
    server2:
      ansible_host: 192.168.1.35
      ip: 192.168.1.35
      access_ip: 192.168.1.35
    server3:
      ansible_host: 192.168.1.32
      ip: 192.168.1.32
      access_ip: 192.168.1.32
    server4: # the new worker node
      ansible_host: 192.168.1.32
      ip: 192.168.1.32
      access_ip: 192.168.1.32
  children:
    kube-master:
      hosts:
        server1:
        server2:
    kube-node:
      hosts:
        server1:
        server2:
        server3:
        server4: # the new worker node
    etcd:
      hosts:
        server1:
        server2:
        server3:
    k8s-cluster:
      children:
        kube-master:
        kube-node:
    calico-rr:
      hosts: {}
```
Finally run the following command in your kubespray clone:
```bash
ansible-playbook -i inventory/mycluster/hosts.yaml  scale.yml -b -v --private-key=~/.ssh/id_rsa
```
A few minutes later it's done:
```bash
kubectl get nodes
```
```text
NAME        STATUS   ROLES    AGE   VERSION
server1   Ready    master   90d   v1.19.6
server2   Ready    master   90d   v1.19.6
server3   Ready    <none>   90d   v1.19.6
server4   Ready    <none>   29m   v1.19.6
```

## Remove a worker node from the cluster

Official documentation: https://github.com/kubernetes-sigs/kubespray/blob/master/docs/getting-started.md#adding-nodes

WARNING: not tested yet!

Run the following command in your kubespray clone:
```bash
ansible-playbook -i inventory/mycluster/hosts.yml remove-node.yml -b -v  --private-key=~/.ssh/id_rsa  --extra-vars "node=server3,server4"
```

## ClusterIP vs. NodePort

We will quite often see ``ClusterIP`` and ``NodePort`` in yaml files. Those are service types.

A **ClusterIP** service is reachable only from inside the cluster (between pods). So you can't connect to the service from the outside of the cluster.

A **NodePort** service is reachable from the outside of the cluster through any ``NodeIP:NodePort`` address **even if the pod is not on the node**.

That's the magic the Kubernetes network: 
if there is a single nginx pod on node1, 
and if you setup a NodePort service for it (let's say on port 9999) 
then you will be able to access your nginx with http://node1:9999, http://node2:9999 and http://node3:9999.


## Kubernetes Dashboard

After a Kubespray install, the dashboard is installed:

https://kubespray.io/#/docs/getting-started?id=accessing-kubernetes-dashboard

Dashboard can be accessed at that URL:

https://node1:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login

However as of today Kubespray is installing a dashboard that is not compatible with the latest version of kubernetes:

https://github.com/kubernetes-sigs/kubespray/issues/5347

So we will install a new dashboard. This video has been instrumental:

https://youtu.be/6MnsSvChl1E?t=183

So install the dashboard:
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml
```

Edit the dashboard service to run on NodePort instead of ClusterIP so it can be accessed from outside. 
This command will start a vi editor and once you save, Kubernetes will automatically update the service:
```bash
kubectl -n kubernetes-dashboard edit svc kubernetes-dashboard
```
Scroll down to the end of the file and change this line, then **:wq**:
```yaml
[...]
    targetPort: 8443
  selector:
    k8s-app: kubernetes-dashboard
  sessionAffinity: None
  type: NodePort # replace ClusterIP with NodePort
status:
  loadBalancer: {}
```
Now get all services of the dashboard namespace:
```bash
kubectl -n kubernetes-dashboard get svc
```
It will show something like this:
```text
NAME                        TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)         AGE
dashboard-metrics-scraper   ClusterIP   10.233.9.246   <none>        8000/TCP        28m
kubernetes-dashboard        NodePort    10.233.27.42   <none>        443:30446/TCP   28m
```
We can see that the dashboard is running on port 30446.

So we can access the dashboard at:

https://node1:30446/

Now we need to create an admin user. 

Please note that, per doc (https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md): *Granting admin privileges to Dashboard's Service Account might be a security risk.*
But it's a demo cluster so that's fine.

Create a ``sa_cluster_admin.yaml`` file:
```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: dashboard-admin
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: cluster-admin-rolebinding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: dashboard-admin
  namespace: kube-system
```

Create the ``dashboard-admin`` service account with  ``cluster-admin`` role:
```bash
kubectl create -f sa_cluster_admin.yaml
```
Now describe the service account:
```bash
kubectl -n kube-system describe sa dashboard-admin
```

The output is something like this:
```text
Name:                dashboard-admin
Namespace:           kube-system
Labels:              <none>
Annotations:         <none>
Image pull secrets:  <none>
Mountable secrets:   dashboard-admin-token-j7wkt
Tokens:              dashboard-admin-token-j7wkt
Events:              <none>
```

Now describe the secret to get the token:
```bash
kubectl -n kube-system describe secret dashboard-admin-token-j7wkt
```
You can use that token to connect to the dashboard:

https://node1:30446/

## Upgrade Kubernetes with Kubespray

https://www.youtube.com/watch?v=M499ckeGZL8

Official documentation: https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/

Official documentation of upgrade using Kubespray: https://github.com/kubernetes-sigs/kubespray/blob/master/docs/upgrades.md

### Warning

Upgrading a cluster can only be done from one minor version to the next one.
Here from ``1.17.5`` to ``1.18.3``. It cannot be done from ``1.16.0`` to ``1.18.3`` for instance.

Official documentation advises you to read the release notes (here for 1.18):

https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.18.md

It is very important to do so because some APIs may have changed, been deprecated etc... 
For instance:
```text
All resources within the rbac.authorization.k8s.io/v1alpha1 and rbac.authorization.k8s.io/v1beta1 API groups are deprecated in favor of rbac.authorization.k8s.io/v1, and will no longer be served in v1.20. 
```
It might require you to rewrite your existing Kubernetes deployment manifests.

It is particularly true if you are using alpha API (and that is very likely).

### Upgrading

The upgrade is done using the following command, issued from a kubespray git clone (after a git pull):
```bash
ansible-playbook upgrade-cluster.yml -b -i  inventory/mycluster/hosts.yaml -e kube_version=v1.18.3
```
The ``inventory/mycluster/hosts.yaml`` file is the previously generated by kubespray.

The ``-e kube_version=v1.18.3`` option will override the value defined in ``inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml``.

The upgrade is likely to take 30 or 45 minutes.

It will be a gentle upgrade: the upgrade will comply to pod disruption budgets.

### Unexpected errors

During my upgrade process, I did hit pod disruption budgets limits that stopped the 
Kubernetes upgrade. So I launched the command multiple times.

In the end my nodes were all in the ``Ready,SchedulingDisabled`` state and I had to launch those commands
to resume scheduling on my nodes:
```bash
kubectl uncordon node1
kubectl uncordon node2
kubectl uncordon node3
``` 
I am not sure this was to be expected though...

After the upgrade it looks like my ingresses were no longer working.

# Learn Kubernetes

The content of this paragraph is directly coming from the playlist mentioned in the intro:

https://www.youtube.com/playlist?list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0

## Running docker containers

https://www.youtube.com/watch?v=-NzB4sPZXwU

After a default Kubespray install, you have docker installed on all your nodes.

By default kubectl commands are executed in the ``default`` namespace. 

At the beginning there is nothing in it but the kubernetes service into it  (leave the watch running in a terminal):
```bash
watch kubectl get all -o wide
```
```text
NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE   SELECTOR
service/kubernetes   ClusterIP   10.233.0.1   <none>        443/TCP   27h   <none>
```

We will start an interactive shell in a busybox container (this will download the image): 
```bash
kubectl run myshell -it --image busybox -- sh
```
If required, note that we can force a pull of the image using the ``--image-pull-policy Always`` option: 
```bash
kubectl run myshell -it --image busybox --image-pull-policy Always -- sh
```

After that you have a pod that is running on node3 (watch kubectl get all -o wide):
```text
NAME          READY   STATUS    RESTARTS   AGE   IP            NODE    NOMINATED NODE   READINESS GATES
pod/myshell   1/1     Running   0          13s   10.233.92.6   node3   <none>           <none>

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE   SELECTOR
service/kubernetes   ClusterIP   10.233.0.1   <none>        443/TCP   28h   <none>
```

And indeed, on ``node3`` you have the image and a container:
```bash
ansible node3 -a "docker images" | grep busybox
```
```text
busybox                              latest              be5888e67be6        5 days ago          1.22MB
```
```bash
ansible node3 -a "docker ps" | grep busybox
```
```text
7014c8677215        busybox                       "sh"                     4 minutes ago       Up 4 minutes                            k8s_myshell_myshell_default_99e5e588-00d6-47da-9581-8623f21232ed_0
```

If you exit the interactive busybox session:
```bash
exit
```

... the pod is still running. Remove it with:
```bash
kubectl delete pod myshell
```

Let's start an nginx (running by default on port 80), this time we'll use a deployment since it will allow us 
to create multiple instances of nginx:
```bash
kubectl create deployment nginx --image=nginx
```
The deployment will create a pod, a deployment and a replicaset (``watch kubectl get all -o wide``):
```text
NAME                         READY   STATUS    RESTARTS   AGE    IP            NODE    NOMINATED NODE   RE
ADINESS GATES
pod/nginx-86c57db685-5fpm9   1/1     Running   0          100s   10.233.92.9   node3   <none>           <none>

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE   SELECTOR
service/kubernetes   ClusterIP   10.233.0.1   <none>        443/TCP   29h   <none>

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE    CONTAINERS   IMAGES   SELECTOR
deployment.apps/nginx   1/1     1            1           101s   nginx        nginx    app=nginx

NAME                               DESIRED   CURRENT   READY   AGE    CONTAINERS   IMAGES   SELECTOR
replicaset.apps/nginx-86c57db685   1         1         1       101s   nginx        nginx    app=nginx,pod-template-hash=86c57db685
```

Access it with port forward:
```bash
kubectl port-forward nginx-86c57db685-5fpm9 8080:80
```
```text
Forwarding from 127.0.0.1:8080 -> 80
Forwarding from [::1]:8080 -> 80
```
```bash
curl localhost:8080 | grep Welcome
```
```html
<title>Welcome to nginx!</title>
<h1>Welcome to nginx!</h1>
```

You can see nginx logs and follow them with -f:
```bash
kubectl logs nginx 
kubectl logs -f nginx 
```
Then you can increase the number of nginx pods of the deployment:
```bash
kubectl scale deployment nginx --replicas=2
```
After that you have a second nginx pod (``watch kubectl get all -o wide``):
```text
NAME                         READY   STATUS    RESTARTS   AGE     IP             NODE    NOMINATED NODE   READINESS GATES
pod/nginx-86c57db685-5fpm9   1/1     Running   0          6m54s   10.233.92.9    node3   <none>           <none>
pod/nginx-86c57db685-7lwrq   1/1     Running   0          82s     10.233.90.16   node1   <none>           <none>

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE   SELECTOR
service/kubernetes   ClusterIP   10.233.0.1   <none>        443/TCP   29h   <none>

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS   IMAGES   SELECTOR
deployment.apps/nginx   2/2     2            2           6m55s   nginx        nginx    app=nginx

NAME                               DESIRED   CURRENT   READY   AGE     CONTAINERS   IMAGES   SELECTOR
replicaset.apps/nginx-86c57db685   2         2         2       6m55s   nginx        nginx    app=nginx,pod-template-hash=86c57db685
```

To access them in a load-balanced way, you need to create a service:
```bash
kubectl expose deployment nginx --type NodePort --port 80
```
After that you have a new nginx service running on NodePort 30987 (``watch kubectl get all -o wide``):
```text
NAME                         READY   STATUS    RESTARTS   AGE     IP             NODE    NOMINATED NODE   READINESS GATES
pod/nginx-86c57db685-5fpm9   1/1     Running   0          14m     10.233.92.9    node3   <none>           <none>
pod/nginx-86c57db685-7lwrq   1/1     Running   0          8m30s   10.233.90.16   node1   <none>           <none>

NAME                 TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)        AGE   SELECTOR
service/kubernetes   ClusterIP   10.233.0.1    <none>        443/TCP        29h   <none>
service/nginx        NodePort    10.233.5.78   <none>        80:30987/TCP   61s   app=nginx

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS   IMAGES   SELECTOR
deployment.apps/nginx   2/2     2            2           14m   nginx        nginx    app=nginx

NAME                               DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES   SELECTOR
replicaset.apps/nginx-86c57db685   2         2         2       14m   nginx        nginx    app=nginx,pod-template-hash=86c57db685
```
By definition of NodePort, it means you access the service from any node:
```text
curl node1:30987 | grep Welcome
curl node2:30987 | grep Welcome
curl node3:30987 | grep Welcome
```
This is true even if nginx pods are actually deployed on 2 nodes only 
(see Endpoints, and note IP addresses that those of nginx pods above):
```bash
kubectl describe service nginx
```
```text
Name:                     nginx
Namespace:                default
Labels:                   app=nginx
Annotations:              <none>
Selector:                 app=nginx
Type:                     NodePort
IP:                       10.233.5.78
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  30987/TCP
Endpoints:                10.233.90.16:80,10.233.92.9:80
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>
```
Now we can get a yaml file from the existing deployment and service:
```bash
kubectl get deploy nginx -o yaml  > /tmp/nginx.yml
kubectl get svc nginx -o yaml > /tmp/nginx-svc.yml
```
Files are too long to be displayed here (they are containing a lot of default values).

Let's delete the deployment and the service:
```bash
kubectl delete deploy nginx
kubectl delete service nginx
```

Now let's create exactly the same from yaml files:
```bash
kubectl create -f /tmp/nginx.yml -f /tmp/nginx-svc.yml
```
And delete it from yaml files:
```bash
kubectl delete -f /tmp/nginx.yml -f /tmp/nginx-svc.yml
```

## Pod, replicaset and deployment

https://www.youtube.com/watch?v=deFfAUZpoxs

You can have multiple containers inside a pod: e.g. apache (with PHP) and mysql in the same pod.

But you have to think about the scaling and the update of you application. 
You certainly want to have multiple Apache (with PHP) servers, but you don't want to have many (and independant) Mysql servers.

### Pod
Let's create a pod using this ``1-nginx-pod.yaml`` file:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - image: nginx
    name: nginx
``` 
```bash
kubectl create -f 1-nginx-pod.yaml 
```
You can describe the pod (output is too verbose to be listed here):
```bash
kubectl describe pod nginx 
```

Now you have 2 ways to delete the pod:
```bash
kubectl delete pod nginx
kubectl delete -f 1-nginx-pod.yaml
```

After you've done this the pod is gone. And your application is broken. So you want multiple instances of nginx and failover.
That's the purpose of replicasets.

### Replicaset

Let's create a replicaset using this ``1-nginx-replicaset.yaml`` file:

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  labels:
    run: nginx # all pods created with this replicaset will have this metadata
  name: nginx-replicaset
spec:
  replicas: 2  # we want 2 replicas
  selector:    # this replicaset manages pods based on this selection criteria
    matchLabels:
      run: nginx   # pods must have a run label with nginx value
  template:    # tells how to create the pods
    metadata:
      labels:
        run: nginx
    spec:
      containers:
      - image: nginx
        name: nginx
```
```bash
kubectl create -f 1-nginx-replicaset.yaml
```
It has this effect (watch...):
```text
NAME                         READY   STATUS    RESTARTS   AGE   IP             NODE    NOMINATED NODE   READINESS GATES
pod/nginx-replicaset-dzrxc   1/1     Running   0          56s   10.233.92.13   node3   <none>           <none>
pod/nginx-replicaset-j2d4f   1/1     Running   0          56s   10.233.90.25   node1   <none>           <none>

NAME                               DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES   SELECTOR
replicaset.apps/nginx-replicaset   2         2         2       56s   nginx        nginx    run=nginx
```
Now if you kill one of the pods:
```bash
kubectl delete pod nginx-replicaset-dzrxc
```
You can see the replicaset immediatly starting a new pod (because we want 2 replicas)
```text
NAME                         READY   STATUS              RESTARTS   AGE     IP             NODE    NOMINATED NODE   READINESS GATES
pod/nginx-replicaset-7zz72   0/1     ContainerCreating   0          4s      <none>         node3   <none>           <none>
pod/nginx-replicaset-dzrxc   0/1     Terminating         0          2m27s   <none>         node3   <none>           <none>
pod/nginx-replicaset-j2d4f   1/1     Running             0          2m27s   10.233.90.25   node1   <none>           <none>

NAME                               DESIRED   CURRENT   READY   AGE     CONTAINERS   IMAGES   SELECTOR
replicaset.apps/nginx-replicaset   2         2         1       2m27s   nginx        nginx    run=nginx
```
Now to delete the replicaset:
```bash
kubectl delete replicaset nginx-replicaset
```
The problem with replicasets is the lifecycle of the application. How do you update your application?
This is best managed with deployments.

### Deployment

A deployment is able to do a rolling update of your pods. 
You can say for instance that you want 50% of replicas to be available during the update.

A ``1-nginx-deployment.yaml`` deployment file (without any option) is very similar to a replicaset:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    run: nginx
  name: nginx-deploy
spec:
  replicas: 2
  selector:
    matchLabels:
      run: nginx
  template:
    metadata:
      labels:
        run: nginx
    spec:
      containers:
        - image: nginx
          name: nginx
```
When you're creating a deployment, it will automatically create a replicaset.

Let's deploy it:
```bash
kubectl create -f 1-nginx-deployment.yaml
```
It has this effect (watch...):
```text
NAME                                READY   STATUS    RESTARTS   AGE   IP             NODE    NOMINATED NODE   READINESS GATES
pod/nginx-deploy-6db489d4b7-67b58   1/1     Running   0          16s   10.233.90.26   node1   <none>           <none>
pod/nginx-deploy-6db489d4b7-8r2k4   1/1     Running   0          16s   10.233.92.15   node3   <none>           <none>

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS   IMAGES   SELECTOR
deployment.apps/nginx-deploy   2/2     2            2           16s   nginx        nginx    run=nginx

NAME                                      DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES   SELECTOR
replicaset.apps/nginx-deploy-6db489d4b7   2         2         2       16s   nginx        nginx    pod-template-hash=6db489d4b7,run=nginx
```
The description of the pod is containing the reference to its replicaset:
```bash
kubectl describe pod nginx-deploy-6db489d4b7-67b58
```
```text
Name:         nginx-deploy-6db489d4b7-67b58
etc...
Controlled By:  ReplicaSet/nginx-deploy-6db489d4b7
```

The description of the replicaset is containing the reference to its deployment:
```bash
kubectl describe replicasets.apps nginx-deploy-6db489d4b7
```
```text
Name:           nginx-deploy-6db489d4b7
etc...
Controlled By:  Deployment/nginx-deploy
```

You can get pods by label:
```bash
kubectl get pods -l run=nginx
```
```text
NAME                            READY   STATUS    RESTARTS   AGE
nginx-deploy-6db489d4b7-67b58   1/1     Running   0          7m55s
nginx-deploy-6db489d4b7-8r2k4   1/1     Running   0          7m55s
```

Cleanup:
```bash
kubectl delete deploy nginx-deploy
```

## Namespaces

https://youtu.be/2h6TAJirDqI?list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&t=181

Namespaces are useful to separate your pods in logical groups, without having any
risk of name collision. It prevents from prefixing your pods names for instance.

To list namespaces:
```bash
kubectl get ns
```
```text
NAME                   STATUS   AGE
default                Active   2d6h
kube-system            Active   2d6h
```
If you don't specify the -n command-line argument, you're in the ``default`` namespace.

You can't create the same pod twice in the same namespace:
```bash
kubectl run nginx --image=nginx 
kubectl run nginx --image=nginx 
```
```text
pod/nginx created
Error from server (AlreadyExists): pods "nginx" already exists
```

Now let's try to see how we can prevent from having to type ``-n namespace``.

Let's display the config:
```bash
kubectl config view
```
You have something like this:
```yaml
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://192.168.1.12:6443
  name: cluster.local  # name of the cluster
contexts:
- context:
    cluster: cluster.local
    user: kubernetes-admin
  name: kubernetes-admin@cluster.local  # name of the context
current-context: kubernetes-admin@cluster.local
kind: Config
preferences: {}
users:
- name: kubernetes-admin  # name of the user
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED
```

Let's create a new context with the kube-system namespace:
```bash
kubectl config set-context kubesys --namespace=kube-system --user=kubernetes-admin --cluster=cluster.local
```
Now you have 2 contexts:
```bash
kubectl config get-contexts
```
```text
CURRENT   NAME                                         CLUSTER               AUTHINFO                           NAMESPACE
*         kubernetes-admin@cluster.local               cluster.local         kubernetes-admin                   
          kubesys                                      cluster.local         kubernetes-admin                   kube-system
```
The current context is:
```bash
kubectl config current-context
```
```text
kubernetes-admin@cluster.local
```
Change the default context:
```bash
kubectl config use-context kubesys
```
Now if you ask for the pods, you'll get those of the kube-system namespace:
```bash
kubectl get pods
```

Let's create a demo namespance and a new context using the demo namespace:
```bash
kubectl create namespace demo
kubectl config set-context demo --namespace=demo --user=kubernetes-admin --cluster=cluster.local
kubectl config use-context demo
```

You can define aliases to easily switch contexts:
```bash
alias kcc="kubectl config current-context"
alias kuc="kubectl config use-context"
```
Now we are in the demo context, we can create another nginx pod:
```bash
kubectl run nginx --image=nginx 
```
And now it's working.

Delete everything and back to default namespace:
```bash
kubectl delete pod nginx
kuc kubernetes-admin@cluster.local
kubectl delete pod nginx
```
## Node Selectors

https://www.youtube.com/watch?v=TFAASAfO_gg

You can attach labels to nodes. This can be useful if you want to schedule deployments
on nodes having certain attributes (fast disks, GPU, etc...).

```bash
kubectl label node node2 demoserver=true
kubectl get nodes node2 --show-labels
```
And we can see the label in the output of the second command:
```text
NAME    STATUS   ROLES    AGE    VERSION   LABELS
node2   Ready    master   3d3h   v1.17.5   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/os=linux,demoserver=true,kubernetes.io/arch=amd64,kubernetes.io/hostname=node2,kubernetes.io/os=linux,node-role.kubernetes.io/master=
```
Now let's create a ``1-nginx-deployment-nodeselector.yaml`` deployment file:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    run: nginx
  name: nginx-deploy
spec:
  replicas: 1
  selector:
    matchLabels:
      run: nginx
  template:
    metadata:
      labels:
        run: nginx
    spec:
      containers:
        - image: nginx
          name: nginx
      nodeSelector:         # the node selector...
        demoserver: "true"  # ... will select nodes with the demoserver=true label
```
We can see in the output (watch...) that the pod has been scheduled on node2:
```text
NAME                                READY   STATUS    RESTARTS   AGE    IP            NODE    NOMINATED NODE   READINESS GATES
pod/nginx-deploy-5f7fbc9dd8-b6hg2   1/1     Running   0          114s   10.233.96.4   node2   <none>           <none>

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE    CONTAINERS   IMAGES   SELECTOR
deployment.apps/nginx-deploy   1/1     1            1           114s   nginx        nginx    run=nginx

NAME                                      DESIRED   CURRENT   READY   AGE    CONTAINERS   IMAGES   SELECTOR
replicaset.apps/nginx-deploy-5f7fbc9dd8   1         1         1       114s   nginx        nginx    pod-template-hash=5f7fbc9dd8,run=nginx
```

You can see the node selector we describing the pod:
```bash
kubectl describe pod nginx-deploy-5f7fbc9dd8-b6hg2  | grep Selector
```
```text
Node-Selectors:  demoserver=true
```
And if you scale the deployment:
```bash
kubectl scale deployment nginx-deploy --replicas=2
```
The new pod has also been scheduled on node2 (otherwise another node would have been preferred):
```text
NAME                                READY   STATUS    RESTARTS   AGE    IP            NODE    NOMINATED NODE   READINESS GATES
pod/nginx-deploy-5f7fbc9dd8-b6hg2   1/1     Running   0          6m8s   10.233.96.4   node2   <none>           <none>
pod/nginx-deploy-5f7fbc9dd8-qxn2p   1/1     Running   0          65s    10.233.96.5   node2   <none>           <none>
```
Clean-up:
```bash
kubectl delete deploy nginx-deploy
```
To remove the label on the node:
```bash
kubectl label node node2 demoserver-
```

## Schedule a pod on a specific node

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  nodeName: server2 # schedule pod to specific node
  containers:
  - name: nginx
    image: nginx
```

## PodNodeSelector Admission Control Plugin

https://www.youtube.com/watch?v=j3ft8k0HC8s

Offficial documentation:

https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/

It can happen that you want to make sure pods created in a given namespace are scheduled
on given nodes. For instance ``prod`` namespace should be associated to powerful node, 
and the ``dev`` namespace should be associated to regular nodes. 

The PodNodeSelector plugin will let you edit the namespace, instead of setting a node
selector on each pod.

Let's first label the nodes:
```bash
kubectl label node node1 env=dev
kubectl label node node2 env=prod
```

Now let's ssh on master machine(s) and edit the ``kube-apiserver.yaml`` file:
```bash
ssh user@node1
sudo vi /etc/kubernetes/manifests/kube-apiserver.yaml
```
Add ``,PodNodeSelector`` to the ``--enable-admission-plugins`` line:
```yaml
- --enable-admission-plugins=NodeRestriction,PodNodeSelector
```
Save the file and the kubernetes API will restart automatically. 

Logout from ssh.

Now let's create namespaces:
```yaml
kubectl create ns dev
kubectl create ns prod
```
And edit them (this will open a vi editor):
```bash
kubectl edit ns dev
```
```yaml
apiVersion: v1
kind: Namespace
metadata:
  creationTimestamp: "2020-04-21T18:33:29Z"
  name: dev
  annotations:  # add this line and the following
    scheduler.alpha.kubernetes.io/node-selector: "env=dev"
  resourceVersion: "161399"
  selfLink: /api/v1/namespaces/dev
  uid: 8501e7ba-1183-4169-890b-ab13990e5d3b
spec:
  finalizers:
  - kubernetes
status:
  phase: Active
```
And to the same for prod.

Now run some nginx in the dev namespace:
```bash
kubectl -n dev create -f 1-nginx-deployment.yaml 
```
We can see that both pods are created on node1 (labelled with env=dev)
```text
NAME                                READY   STATUS    RESTARTS   AGE   IP             NODE    NOMINATED NODE   READINESS GATES
pod/nginx-deploy-6db489d4b7-2jqq2   1/1     Running   0          58s   10.233.90.33   node1   <none>           <none>
pod/nginx-deploy-6db489d4b7-6kzft   1/1     Running   0          58s   10.233.90.34   node1   <none>           <none>
```
And if you describe the pod you see that a Node selector has automatically been added:
```bash
kubectl -n dev describe pod nginx-deploy-6db489d4b7-6kzft | grep Selector
```
```text
Node-Selectors:  env=dev
```
If we deploy on the prod namespace, pods will go on node2.

Cleanup:
```bash
kubectl -n dev delete -f 1-nginx-deployment.yaml
```

## DaemonSets

https://youtu.be/PWBpy4IlfMQ?t=62

A daemonset is a pod that will be deployed on each node of the cluster. You can target specific nodes using labels.

Let's create a ``1-nginx-daemonset.yaml``:
```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: nginx-daemonset
spec:
  selector:      # containers will be grouped by this label
    matchLabels:
      demotype: nginx-daemonset-demo
  template:
    metadata:
      labels:    # in the template you're setting the label
        demotype: nginx-daemonset-demo
    spec:
      containers:
      - image: nginx
        name: nginx
```
Then create the daemonset:
```bash
kubectl create -f 1-nginx-daemonset.yaml
```
And you can observe (watch...):
```text
NAME                        READY   STATUS    RESTARTS   AGE   IP             NODE    NOMINATED NODE   READINESS GATES
pod/nginx-daemonset-gcg7b   1/1     Running   0          34s   10.233.92.21   node3   <none>           <none>
pod/nginx-daemonset-gndmq   1/1     Running   0          34s   10.233.96.8    node2   <none>           <none>
pod/nginx-daemonset-zn7nl   1/1     Running   0          34s   10.233.90.35   node1   <none>           <none>
```
If we describe the daemonset, we can see how it is targetting pods:
```bash
kubectl describe daemonsets nginx-daemonset | grep Selector
```
```text
Selector:       demotype=nginx-daemonset-demo
```
If we describe the pod we can see it is controlled by the daemonset:
```bash
kubectl describe pod nginx-daemonset-gcg7b | grep Control
```
```text
Controlled By:  DaemonSet/nginx-daemonset
```
Like replicasets, if you kill a pod it will be recreated automatically.

Cleanup:
```bash
kubectl delete -f 1-nginx-daemonset.yaml
```
There exists some daemonsets by default:
```bash
kubectl -n kube-system get daemonsets
```
```text
NAME           DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR                                        AGE
calico-node    3         3         3       3            3           <none>                                               3d4h
kube-proxy     3         3         3       3            3           beta.kubernetes.io/os=linux,kubernetes.io/os=linux   3d5h
nodelocaldns   3         3         3       3            3           <none>                                               3d4h
```
For instance calico takes care of the network.

You can target nodes:
```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: nginx-daemonset-dev
spec:
  selector:      
    matchLabels:
      demotype: nginx-daemonset-demo-dev
  template:
    metadata:
      labels:   
        demotype: nginx-daemonset-demo-dev
    spec:
      containers:
      - image: nginx
        name: nginx
      nodeSelector:  # you can use a node selector that will match node labels
        env: dev
```
If we describe this daemonset we can see the node selector:
```text
NAME                                 DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE   CONTAINERS   IMAGES   SELECTOR
daemonset.apps/nginx-daemonset-dev   1         1         0       1            0           env=dev         3s    nginx        nginx    demotype=nginx-daemonset-demo-dev
```

## Jobs and cronjobs

https://youtu.be/uJKE0d6Y_yg?t=172

### Jobs
A job is a pod containing an executable that will terminate at some point.

Let's write a ``2-job.yaml`` job file:
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: helloworld
spec:
  template:
    spec:
      containers:
        - name: busybox
          image: busybox
          command: ["echo", "Hello Kubernetes!!!"]
      restartPolicy: Never
```
And launch it:
```bash
kubectl create -f 2-job.yaml
```
Once the job is complete, we can observe (watch...):
```text
NAME                   READY   STATUS      RESTARTS   AGE   IP             NODE    NOMINATED NODE   READINESS GATES
pod/helloworld-xxkl9   0/1     Completed   0          33s   10.233.92.23   node3   <none>           <none>

NAME                   COMPLETIONS   DURATION   AGE   CONTAINERS   IMAGES    SELECTOR
job.batch/helloworld   1/1           4s         33s   busybox      busybox   controller-uid=3eedffe4-ef98-4f30-aa01-743bc0b5769d
```
Now take a look at the logs of the pod:
```bash
kubectl logs helloworld-xxkl9
```
```text
Hello Kubernetes!!!
```
You can have the status, start date, termination date and duration of a job:
```bash
kubectl describe job helloworld | head -n11
```
```text
Name:           helloworld
Namespace:      default
Selector:       controller-uid=3eedffe4-ef98-4f30-aa01-743bc0b5769d
Labels:         controller-uid=3eedffe4-ef98-4f30-aa01-743bc0b5769d
                job-name=helloworld
Annotations:    <none>
Parallelism:    1
Completions:    1
Start Time:     Wed, 22 Apr 2020 19:36:29 +0200
Completed At:   Wed, 22 Apr 2020 19:36:33 +0200
Duration:       4s
```
You have to delete jobs manually:
```bash
kubectl delete job helloworld
```
In order to automatically cleanup terminated job pods, you can activate the *TTL Controller for Finished Resources* (see chapter below):

https://kubernetes.io/docs/concepts/workloads/controllers/ttlafterfinished/
 
Now let's modify the job so it will run longer:
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: helloworld
spec:
  template:
    spec:
      containers:
        - name: busybox
          image: busybox
          command: ["sleep", "60"]
      restartPolicy: Never
```
If you run this job and kill the ``helloworld-4xzsx`` pod it has created, then another
pod is automatically restarted:
```text
NAME                   READY   STATUS              RESTARTS   AGE   IP             NODE    NOMINATED NODE   READINESS GATES
pod/helloworld-4xzsx   1/1     Terminating         0          20s   10.233.92.24   node3   <none>           <none>
pod/helloworld-dbd9z   0/1     ContainerCreating   0          6s    <none>         node3   <none>           <none>

NAME                   COMPLETIONS   DURATION   AGE   CONTAINERS   IMAGES    SELECTOR
job.batch/helloworld   0/1           20s        20s   busybox      busybox   controller-uid=3084e669-7a72-432a-b8c4-32c4661fe2fa
```
That's because Kubernetes will restart the pod until there is a 0 exit code.

If you want a job to be run twice:
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: helloworld
spec:
  completions: 2  # run the job twice
  template:
    spec:
      containers:
        - name: busybox
          image: busybox
          command: ["echo", "Hello Kubernetes!!!"]
      restartPolicy: Never
```
It will launch a pod, wait for it to terminate, then launch another pod:
```text

NAME                   READY   STATUS              RESTARTS   AGE   IP             NODE    NOMINATED NODE   READINESS GATES
pod/helloworld-h8m2l   0/1     ContainerCreating   0          5s    <none>         node3   <none>           <none>
pod/helloworld-nrdcz   0/1     Completed           0          9s    10.233.92.27   node3   <none>           <none>

NAME                   COMPLETIONS   DURATION   AGE   CONTAINERS   IMAGES    SELECTOR
job.batch/helloworld   1/2           9s         9s    busybox      busybox   controller-uid=2deaf673-23a8-4b28-9ad0-e4b7df4
```
You can have a report:
```bash
kubectl describe job helloworld  | head -n12 | tail -n6
```
```text
Parallelism:    1
Completions:    2
Start Time:     Wed, 22 Apr 2020 19:53:35 +0200
Completed At:   Wed, 22 Apr 2020 19:53:44 +0200
Duration:       9s
Pods Statuses:  0 Running / 2 Succeeded / 0 Failed
```

If you want a job to be run twice in parallel:
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: helloworld
spec:
  completions: 2  # run the job twice...
  parallelism: 2  # ... in parallel
  template:
    spec:
      containers:
        - name: busybox
          image: busybox
          command: ["echo", "Hello Kubernetes!!!"]
      restartPolicy: Never
```

Let's write a job that will fail:
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: helloworld
spec:
  template:
    spec:
      containers:
        - name: busybox
          image: busybox
          command: ["ls", "/foobar"] # will fail
      restartPolicy: Never
```
If you create that one it will keep on creating pods because the exit code will never be 0!
So you have to specify a limit:
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: helloworld
spec:
  backoffLimit: 3  # it won't fail more than 3 times (so you wont
  template:
    spec:
      containers:
        - name: busybox
          image: busybox
          command: ["ls", "/foobar"] # will fail
      restartPolicy: Never
```
And if you describe the job:
```bash
kubectl describe job helloworld  | tail -n1
```
```text
  Warning  BackoffLimitExceeded  2m41s  job-controller  Job has reached the specified backoff limit
```
You can specify a timeout for a job:
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: helloworld
spec:
  activeDeadlineSeconds: 5  # terminate the pod if running more than 5 seconds
  template:
    spec:
      containers:
        - name: busybox
          image: busybox
          command: ["sleep", "60"]
      restartPolicy: Never
```
And if you describe the job:
```bash
kubectl describe job helloworld  | tail -n1
```
```text
  Warning  DeadlineExceeded  14s   job-controller  Job was active longer than specified deadline
```
### Cronjobs

It is a kubernetes job having a cron schedule:

```yaml
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: helloworld-cron
spec:
  schedule: "* * * * *" # run every minute
  jobTemplate:          # the job to be run
    spec:
      template:
        spec:
          containers:
            - name: busybox
              image: busybox
              command: ["echo", "Hello Kubernetes!!!"]
          restartPolicy: Never
```

By default it will hold the last 3 jobs (here after 2 minutes or so) and the last failed job:
```text
NAME                                   READY   STATUS      RESTARTS   AGE   IP             NODE    NOMINATED NODE   READINESS GATES
pod/helloworld-cron-1587579540-chr4b   0/1     Completed   0          90s   10.233.92.40   node3   <none>           <none>
pod/helloworld-cron-1587579600-5rg66   0/1     Completed   0          30s   10.233.92.41   node3   <none>           <none>

NAME                                   COMPLETIONS   DURATION   AGE   CONTAINERS   IMAGES    SELECTOR
job.batch/helloworld-cron-1587579540   1/1           9s         90s   busybox      busybox   controller-uid=f3c0516c-ed5a-47d9-b044-892f53902795
job.batch/helloworld-cron-1587579600   1/1           8s         30s   busybox      busybox   controller-uid=b0c1225f-a3ec-453f-9c86-0046a9513e67

NAME                            SCHEDULE    SUSPEND   ACTIVE   LAST SCHEDULE   AGE     CONTAINERS   IMAGES    SELECTOR
cronjob.batch/helloworld-cron   * * * * *   False     0        38s             2m29s   busybox      busybox   <none>
```

Delete the cronjob:
```bash
kubectl delete cronjobs helloworld-cron
```

To specify the number of successful/failed jobs to be retained:
```yaml
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: helloworld-cron
spec:
  schedule: "* * * * *" 
  successfulJobsHistoryLimit: 0  # 3 by default
  failedJobsHistoryLimit: 0  # 3 by default
  jobTemplate:          
    spec:
      template:
        spec:
          containers:
            - name: busybox
              image: busybox
              command: ["echo", "Hello Kubernetes!!!"]
          restartPolicy: Never
```

Now let's admit you want to suspend the cron job:
```yaml
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: helloworld-cron
spec:
  schedule: "* * * * *" 
  successfulJobsHistoryLimit: 0  
  failedJobsHistoryLimit: 0  
  suspend: true                # suspend the job
  jobTemplate:          
    spec:
      template:
        spec:
          containers:
            - name: busybox
              image: busybox
              command: ["echo", "Hello Kubernetes!!!"]
          restartPolicy: Never
```
Let's do it with the ``apply`` command:
```bash
kubectl apply -f 2-cronjobs.yaml
```
Now let's resume the job using the ``patch`` command:
```bash
kubectl patch cronjob helloworld-cron -p '{"spec":{"suspend":false}}'
```
Cleanup:
```bash
kubectl delete cronjob helloworld-cron
```

## TTL Controller for Finished Resources 

https://www.youtube.com/watch?v=g0dmgd27DRg

Ssh on master machine(s) and edit:
```bash
ssh user@node1
sudo vi /etc/kubernetes/manifests/kube-apiserver.yaml
```
Add a ``--feature-gates=TTLAfterFinished`` option to the ``kube-apiserver``:
```yaml
  containers:
  - command:
    - kube-apiserver
    - --feature-gates=TTLAfterFinished=true
etc...
```
Save the file and the kubernetes API will restart automatically, then edit: 
```bash
sudo vi /etc/kubernetes/manifests/kube-controller-manager.yaml
```
Add a ``--feature-gates=TTLAfterFinished`` option to the ``kube-controller-manager``:
```yaml
  containers:
  - command:
    - kube-controller-manager
    - --feature-gates=TTLAfterFinished=true
etc...
```
Save the file and the kubernetes controller manager will restart automatically. 

Exit ssh.

Then you can use a new ``ttlSecondsAfterFinished`` job spec option:
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: helloworld
spec:
  ttlSecondsAfterFinished: 20   # the pod will pod auto-removed 20 seconds after job completion
  template:
    spec:
      containers:
        - name: busybox
          image: busybox
          command: ["echo", "Hello Kubernetes!!!"]
      restartPolicy: Never
```

## Init containers

https://www.youtube.com/watch?v=J4S_MfsCPHo

Pods can contain multiple containers. 

Init containers are special: 
* they will be started before any other container in the pod
* they must terminate
* once they terminate the other containers will be started
* if an init container fails, the other containers won't be started

Warning: in case of init container failure, Kubernetes will retry infinitely?

It can be useful, for instance, to checkout the source code of a web application in a volumen
that is shared between the init container and a web application container.

Let's write the ``3-init-container.yaml`` file:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    run: nginx
  name: nginx-deploy
spec:
  replicas: 1
  selector:
    matchLabels:
      run: nginx
  template:
    metadata:
      labels:
        run: nginx
    spec:
      volumes:                # we need a volume
      - name: shared-volume   # called shared-volume
        emptyDir: {}          # emptyDir: will be removed auto when pod is terminated
      initContainers:         # this is an init container
      - name: busybox         # it will create a index.html file for nginx
        image: busybox
        volumeMounts:            # volumes mounted into the init container
        - name: shared-volume    # name of the volume (declared above)
          mountPath: /nginx-data # where it will be mounted
        command: ["/bin/sh"]
        args: ["-c", "echo '<h1>Hello Kubernetes</h1>' > /nginx-data/index.html"]
      containers:             # this container will started after busybox
      - image: nginx          # it's an nginx container serving the index.html
        name: nginx
        volumeMounts:         # volumes mounted into the init container
        - name: shared-volume
          mountPath: /usr/share/nginx/html
```

Then deploy:

```bash
kubectl create -f 3-init-container.yaml 
```
In the output we can see the ``PodInitializing`` status (watch...)
```text
NAME                               READY   STATUS            RESTARTS   AGE   IP             NODE    NOMINATED NODE   READINESS GATES
pod/nginx-deploy-5bbff4698-xs8t5   0/1     PodInitializing   0          5s    10.233.92.54   node3   <none>           <none>

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS   IMAGES   SELECTOR
deployment.apps/nginx-deploy   0/1     1            0           5s    nginx        nginx    run=nginx

NAME                                     DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES   SELECTOR
replicaset.apps/nginx-deploy-5bbff4698   1         1         0       5s    nginx        nginx    pod-template-hash=5bbff4698,run=nginx
```
The emptyDir volume is created here (it is not a docker volume):
```text
/var/lib/kubelet/pods/1ae7c5ce-7b60-4c75-abb5-e7c001d07e46/volumes/kubernetes.io~empty-dir/shared-volume/index.html
```

Now let's expose the service:
```bash
kubectl expose deployment nginx-deploy --type NodePort --port 80
port=$(kubectl describe service nginx-deploy | grep NodePort | grep -o -E "[0-9]+")
curl node1:$port
```
```text
<h1>Hello Kubernetes</h1>
```

If you scale the deployment, the init container will run once again:
```bash
kubectl scale deployment nginx-deploy --replicas=2
```
Cleanup:
```bash
kubectl delete -f 3-init-container.yaml 
```

## Persistent volumes and claims

https://www.youtube.com/watch?v=I9GMUn15Nes

Persistent volumes are used if you want some data to persist when a pod is terminated or re-scheduled.

There are two kinds of storage provisioning: static and dynamic.

Static provisioning:
* Cluster administrators create a persistent volume (PV) in Kubernetes.
* Users of the cluster request persistent volumes using a persistent volume claim (PVC)
* Pod is created that accesses the PV thanks to its PVC

Dynamic provisioning:
* Cluster administrator create a storage class 
* Users of the cluster create a PVC with a storage class
* The storage is provisioned automatically
* When the application is undeployed, the storage is automatically destroyed

However dynamic provisioning is supported by only few providers:
* Amazon ELB, 
* Google Compute Disks, 
* Azure Disk, 
* Azure File...

Some static provisioning providers: 
* NFS, 
* Cinder, 
* Ceph, 
* Glusterfs, 
* HostPath (single node only: will not support multi-nodes cluster)...

If a cluster administrator has created a persistent volume of 10 GB and if a user is requesting a 1 GB volume, 
then the cluster will assign the 10 GB volume to the user. This is a one-to-one mapping: no other user
will be able to use this PV. 

Life cycle of PV is given by it ReclaimPolicy:
* Retain: when pod is deleted, PV and its data will still be there
* Recycle: deprecated, more for dynamic provisioning
* Delete: when pod is delete, it will delete the PV and its data

Access Mode (to be confirmed):
* ReadWriteOnce: the volume can only be mounted with read-write access on a single cluster node (possibly by many pods scheduled on that node)
* ReadWriteMany: the volume can only be mounted with read-write access on many cluster nodes (and by many pods)
* ReadOnlyMany: the volume can be mounted with read-only access on many cluster nodes (and by many pods)

### HostPath

Let's create a /kube directory on node1:
```bash
ansible node1 -b -m file -a "path=/kube state=directory mode=0777"
```
Now create a  persistent volume using this ``4-pv-hostpath.yaml`` file:
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-hostpath
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/kube"
```
List persistent volumes (our volume is not claimed yet):
```bash
kubectl get pv
```
```text
NAME          CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
pv-hostpath   1Gi        RWO            Retain           Available           manual                  10s
```
Now let's create a persistent volume claim with the ``4-pvc-hostpath-fail.yaml`` file:
```yaml

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-hostpath
spec:
  storageClassName: manual  # must match the storage class of the PV
  accessModes:
    - ReadWriteMany         # this will not match the PV above
  resources:
    requests:
      storage: 100Mi
```
```bash
kubectl create -f 4-pvc-hostpath-fail.yaml
```
List pvc:
```bash
kubectl get pvc
```
```text
NAME           STATUS    VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
pvc-hostpath   Pending                                      manual         8s
```
Status is pending because there is no PV matching the PVC:
```bash
kubectl describe pvc pvc-hostpath | tail -n1
```
```text
Warning  ProvisioningFailed  4s (x14 over 3m11s)  persistentvolume-controller  storageclass.storage.k8s.io "manual" not found
```
Delete PVC and create another one with ``ReadWriteOnce`` instead:
```bash
kubectl delete pvc pvc-hostpath
kubectl create -f 4-pvc-hostpath.yaml
kubectl get pvc,pv
```
Now status is Bound, and same for the PV:
```text
NAME                                 STATUS   VOLUME        CAPACITY   ACCESS MODES   STORAGECLASS   AGE
persistentvolumeclaim/pvc-hostpath   Bound    pv-hostpath   1Gi        RWO            manual         19m

NAME                           CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                  STORAGECLASS   REASON   AGE
persistentvolume/pv-hostpath   1Gi        RWO            Retain           Bound    default/pvc-hostpath   manual                  30m
```
Now let's create a container using this volume using the ``4-busybox-pv-hostpath.yaml` file:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: busybox
spec:
  volumes:                     # the pod needs a volume
  - name: host-volume          # this can be any name here
    persistentVolumeClaim:     
      claimName: pvc-hostpath  # this one must match the name of the PVC above
  containers:
  - image: busybox
    name: busybox
    command: ["/bin/sh"]
    args: ["-c", "sleep 600"]
    volumeMounts:
    - name: host-volume       # use the "any name" here 
      mountPath: /mydata      # mount path
```
```bash
kubectl create -f 4-busybox-pv-hostpath.yaml
```
The output shows the pod has been created on node3 (watch...):
```text
NAME          READY   STATUS    RESTARTS   AGE   IP             NODE    NOMINATED NODE   READINESS GATES
pod/busybox   1/1     Running   0          15s   10.233.92.56   node3   <none>           <none>
```
That's too bad because our /kube directory has only been created on node1.
```bash
kubectl exec busybox -- ls -l /mydata
```
```text
total 0
```
```bash
kubectl exec busybox -- touch /mydata/hello
kubectl exec busybox -- ls -l /mydata
```
```text
total 0
-rw-r--r--    1 root     root             0 Apr 23 14:11 hello
```
And indeed, we don't have anything in the /kube directory of node1:
```bash
ansible node1 -a "ls /kube"

If the pod had been created on node1, we would have seen our ``hello`` file.

```
If we delete the pod, pv and pvc are still here:
```bash
kubectl delete pod busybox
kubectl get pvc,pv
```
```text
NAME                                 STATUS   VOLUME        CAPACITY   ACCESS MODES   STORAGECLASS   AGE
persistentvolumeclaim/pvc-hostpath   Bound    pv-hostpath   1Gi        RWO            manual         21m

NAME                           CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                  STORAGECLASS   REASON   AGE
persistentvolume/pv-hostpath   1Gi        RWO            Retain           Bound    default/pvc-hostpath   manual                  32m
```
So you need to delete the PVC and after that the status of the PV is Released:
```bash
kubectl delete pvc pvc-hostpath 
kubectl get pv
```
```text
NAME          CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS     CLAIM                  STORAGECLASS   REASON   AGE
pv-hostpath   1Gi        RWO            Retain           Released   default/pvc-hostpath   manual                  34m
```
Note that you can't claim this volume because of the Retain policy and the Released status.

You have to delete it:
```bash
kubectl delete pv pv-hostpath
```
Note that the ``hello`` file remains on node1.

If you want the volume to be deleted automatically, use the Delete policy:
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-hostpath
  labels:
    type: local
spec:
  storageClassName: manual
  persistentVolumeReclaimPolicy: Delete  # delete
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/kube"
```
```bash
kubectl create -f 4-pv-hostpath-delete.yaml
kubectl create -f 4-pvc-hostpath.yaml
kubectl delete -f 4-pvc-hostpath.yaml
```
But the PV is still here:
```text
NAME                           CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                  STORAGECLASS   REASON   AGE
persistentvolume/pv-hostpath   1Gi        RWO            Delete           Failed   default/pvc-hostpath   manual                  110s
```
Because:
```bash
kubectl describe pv pv-hostpath | tail -n1
```
```text
Warning  VolumeFailedDelete  10m   persistentvolume-controller  host_path deleter only supports /tmp/.+ but received provided /kube
```

There is a ``Recycle`` policy as well, but it is deprecated (it might not work) allowing 
to do an automatic ``rm -rf /kube/*`` when the volume :
```yaml
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-hostpath
  labels:
    type: local
spec:
  storageClassName: manual
  persistentVolumeReclaimPolicy: Recycle # automatically rm -rf /kube/*
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/kube"
```

So we can see HostPath has a lot of constraints...

### Troubleshooting PV deletion

Sometimes PVs are stuck in the ``Terminating`` status after deletion (even though the PVC has actually been deleted):
```text
NAME                      CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS        CLAIM                                                STORAGECLASS   REASON   AGE
pv-hostpath-mongovol1     8Gi        RWO            Retain           Terminating   mongodb/datadir-mymongo-mongodb-primary-0            mongovol                24h
```
There is a workaround to that problem. Edit the PV and remove the ``finalizers`` entry and save:
```bash
kubectl edit pv pv-hostpath-mongovol1
```
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  annotations:
    pv.kubernetes.io/bound-by-controller: "yes"
  creationTimestamp: "2020-05-01T11:40:52Z"
  deletionGracePeriodSeconds: 0
  deletionTimestamp: "2020-05-02T11:34:49Z"
  finalizers:                               # remove this line
  - kubernetes.io/pv-protection             # remove this line
  labels:
    type: local
```

### NFS Volumes

https://youtu.be/to14wmNmRCI

Let's install an NFS server on node1 using this ``site.yaml`` playbook:
```yaml
---
- hosts: node1
  become: yes
  vars:
    nfs_exports: [ "/kube *(rw,sync)" ]
  roles:
    - geerlingguy.nfs
```
```bash
sudo ansible-galaxy install geerlingguy.nfs
ansible-playbook site.yml
```
And install NFS client on all machines:
```bash
ansible k8s -b -m apt -a "name=nfs-common state=present"
```

Now let's create an NFS PV using this ``4-pv-nfs.yaml`` file:
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-nfs-pv1
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteMany
  nfs:
    server: node1
    path: "/kube"
```
```bash
kubectl create -f 4-pv-nfs.yaml
```
Now let's create an NFS PVC using this ``4-pvc-nfs.yaml`` file:
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-nfs-pv1
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 500Mi
```
Create an ``index.html`` file in the NFS share of node1:
```bash
ansible node1 -m shell -a 'echo "<h1>Hello from Kubernetes!</h1>" > /kube/index.html'
```
Create an nginx pod using this ``4-nfs-nginx.yaml`` file:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    run: nginx
  name: nginx-deploy
spec:
  replicas: 3
  selector:
    matchLabels:
      run: nginx
  template:
    metadata:
      labels:
        run: nginx
    spec:
      volumes:
      - name: www
        persistentVolumeClaim:
          claimName: pvc-nfs-pv1    # refers to the claim
      containers:
      - image: nginx
        name: nginx
        volumeMounts:
        - name: www
          mountPath: /usr/share/nginx/html
```
```bash
kubectl create -f 4-nfs-nginx.yaml
````
Once pods are created:
```bash
kubectl get pods
```
```text
NAME                            READY   STATUS    RESTARTS   AGE
nginx-deploy-6fdd5b84cc-422kd   1/1     Running   0          5m26s
nginx-deploy-6fdd5b84cc-sfb8h   1/1     Running   0          5m26s
nginx-deploy-6fdd5b84cc-w5xdd   1/1     Running   0          5m26s
```
You can check them independently:
```bash
kubectl port-forward nginx-deploy-6fdd5b84cc-422kd 8080:80
curl localhost:8080
```
```text
<h1>Hello from Kubernetes!</h1>
```
There are all working and reading their ``index.html`` file from the NFS share.

Cleanup:
```bash
kubectl delete deploy nginx-deploy
kubectl delete pvc pvc-nfs-pv1 
kubectl delete pv pv-nfs-pv1
```

## Getting started with Helm

Official documentation: https://helm.sh/

Normally when you want to deploy an application you're writing yaml files and using kubectl to create corresponding 
resources in the cluster. Helms brings some standardization, documentation so it is easier for people to deploy applications in Kubernetes.
You can think of Helm as a package manager.

Hub of Helm packages: https://hub.helm.sh/ 

A **chart** is a Helm package. It contains all of the resource definitions necessary to run an application, tool, or service inside of a Kubernetes cluster.
Charts come with default values, but Helm make it possible to easily override those values (using command-line or files).
There are existing charts like: MySQL, Redis, Jenkins...

A **repository** is the place where charts can be collected and shared. There are online Helm **repositories** of charts, but you can run your own repo inside your cluster.

A **release** is an instance of a chart running in a Kubernetes cluster.

To summarize: Helm installs **charts** into Kubernetes, creating a new **release** for each installation. And to find new charts, you can search Helm chart **repositories**.

Some Helm command-line options: ``help``, ``install`` ( ``--values``,  ``--name``), ``fetch``, ``list``, 
``status``, ``search``, ``repo update``,
 ``upgrade``,  ``rollback``, ``delete`` ( ``--purge``), ``reset``  ( ``--force``,  ``--rename-helm-home``)

### Installing Helm

Helm is a binary you install on your laptop.

Note that Helm 2.x required and installed a replicaset called **tiller** you must deploy on your cluster. 
This is no longer true with Helm 3.x.

Just download the tgz from https://github.com/helm/helm/releases and to extract the executable somewhere.

If you want be able to install ``stable/*`` charts visible on https://hub.helm.sh/, then run:
```bash
helm repo add stable https://kubernetes-charts.storage.googleapis.com
```

### Installing Helm 2.x (deprecated)

As tiller will do the deployment, we need to give it the permission to do it on our behalf. 
So we're going to create a service account with the ``cluster-admin`` role binding. 
This is not the best practise but that's ok for a demo cluster.

This procedure is described here: https://youtu.be/HTj3MMZE6zg?t=868

### Migrating from Helm 2.x

This procedure is described here: https://youtu.be/aAPtT4uaY1o

## Installing Jenkins in Kubernetes using Helm

https://youtu.be/ObGR0EfVPlg

(not watched yet)

## Configuring Jenkins to connect to Kubernetes

https://youtu.be/DAe2Md9sGNA

https://youtu.be/V4kYbHlQYHg

(not watched yet)

## Jenkins CI CD Pipeline in Kubernetes 

https://www.youtube.com/watch?v=4E80gEen-o0

(not watched yet)

## Secrets

https://youtu.be/ch9YlQZ4xTc?t=114

Secrets are useful for instance to store the username and password of you Mysql database so 
they can be used by pods.
You can store ssh keys, ssl certificates, etc...

First encode username and password in base64:
```bash
echo -n "kubeadmin" | base64
echo -n "mypassword" | base64
```
```text
a3ViZWFkbWlu
bXlwYXNzd29yZA==
```
Create a secret using the ``5-secrets.yaml`` yaml file:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: secret-demo
type: Opaque
data:
  username: a3ViZWFkbWlu
  password: bXlwYXNzd29yZA==
```
```bash
 kubectl create -f 5-secrets.yaml
```
List secrets:
```bash
NAME                  TYPE                                  DATA   AGE
default-token-jc9qt   kubernetes.io/service-account-token   3      5d2h
secret-demo           Opaque                                2      24s
```
Delete it:
```bash
kubectl delete secret secret-demo
```
Now let's create it from command-line:
```bash
kubectl create secret --help
kubectl create secret generic --help
```
```text
Create a secret using specified subcommand.

Available Commands:
  docker-registry Create a secret for use with a Docker registry
  generic         Create a secret from a local file, directory or literal value
  tls             Create a TLS secret
etc...
```
Nice! We can see it is possible to store docker registry credentials.

This one is showing various ways of creating secrets (from values stored in file, from keys...)
```bash
kubectl create secret generic --help
```
Let's create a secret from values provided on the command-line:
```bash
kubectl create secret generic secret-demo --from-literal=username=kubeadmin --from-literal=password=mypassword
```

Then you can refer to this secret using environment variables ``5-pod-secret-env.yaml``:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: busybox2
spec:
  containers:
  - image: busybox
    name: busybox
    command: ["/bin/sh"]
    args: ["-c", "sleep 600"]
    env:
    - name: myusername       # define an env variable...
      valueFrom:             # from...
        secretKeyRef:        # a secret:
          name: secret-demo  # name of the secret
          key: username      # key in the secret
```
```bash
kubectl create -f 5-pod-secret-env.yaml
```
Then display the username:
```bash
kubectl exec busybox -- sh -c "echo \$myusername"
```
```text
kubeadmin
```

You can also mount secrets as volumes ``5-pod-secret-volume.yaml``:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: busybox2
spec:
  volumes:                     # a volume
  - name: secret-volume        # any name
    secret:                    # created from a secret
      secretName: secret-demo  # name of the secret
  containers:
  - image: busybox
    name: busybox
    command: ["/bin/sh"]
    args: ["-c", "sleep 600"]
    volumeMounts:              # mount the volume
    - name: secret-volume      # "any name"
      mountPath: /mydata       # here
```
```bash
kubectl create -f 5-pod-secret-volume.yaml
```
You will have one file per key in the secret (files will contain the value):
```bash
kubectl exec busybox2 -- sh -c "cat /mydata/username && echo '' && cat /mydata/password"
```
```text
kubeadmin
mypassword
```
Funny fact, if you change the secret using apply the container is updated **live**:
```bash
echo -n "newpassword" | base64
# replace in 5-secrets.yaml file
kubectl apply -f 5-secrets.yaml 
kubectl exec busybox2 -- sh -c "cat /mydata/username && echo '' && cat /mydata/password"
```
```text
kubeadmin
newpassword
```

Cleanup:
```bash
kubectl delete pod busybox
kubectl delete pod busybox2
kubectl delete secret secret-demo
```

## Statefulsets

https://youtu.be/r_ZEpPTCcPE?t=73

Official documentation: https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/

Statefulsets are pods with a unique name, a unique stable network identity, a unique stable storage and an ordered provisioning.

Pods of a statefulset are named ``$(statefulset name)-$(ordinal)``. 
So if the statefulset is called ``web``, pods will be called ``web-0``, ``web-1``, ``web-2``, ``web-3``

Unlike deployments (that basically consist in multiple independent pods) pods of a statefulset 
known each other and have a way to communicate between each other through that unique stable network identity (hostname).
That stable hostname is derived from statefulset, headless service and namespace names:
``$(statefulset name)-$(ordinal)-$(service name).$(namespace).svc.cluster.local``

Ordered provisioning: 
* when creating/starting the pods the order will be ``web-0``, then ``web-1``, etc...
* when deleting/stopping the pods the order will be ``web-3``, then ``web-2``, etc...
* if an error happens during the start of ``web-1`` then ``web-2`` and ``web-3`` won't be started.
* if an error happens during the stop of ``web-2`` then ``web-1`` and ``web-0`` won't be stopped.
* rolling updates will start from the last pod

Unique stable storage: each pod has its dedicated PersistentVolume : ``pv-0``, ``pv-1``, ``pv-2``, ``pv-3``
And if the ``web-1`` is rescheduled on another node, the new ``web-1`` pod will have the same ``pv-1`` volume (so the same data).

### Create NFS shares

Let's install an NFS server on node1 using this ``site2.yaml`` playbook:
```yaml
---
- hosts: node1
  become: yes
  vars:
    nfs_exports:
    - "/srv/nfs/kubedata/pv0 *(rw,sync)"
    - "/srv/nfs/kubedata/pv1 *(rw,sync)"
    - "/srv/nfs/kubedata/pv2 *(rw,sync)"
    - "/srv/nfs/kubedata/pv3 *(rw,sync)"
    - "/srv/nfs/kubedata/pv4 *(rw,sync)"
  tasks:
    - file: path=/srv/nfs/kubedata/pv{{item}} mode=0777 state=directory
      loop: [ "0", "1", "2", "3", "4" ]
    - file: path=/srv/nfs/kubedata mode=0777 state=directory
  roles:
    - geerlingguy.nfs
```
```bash
# if not done already
sudo ansible-galaxy install geerlingguy.nfs
ansible-playbook site2.yaml
```
And install NFS client on all machines:
```bash
ansible k8s -b -m apt -a "name=nfs-common state=present"
```

### Create PVs

Here we'll be using static provisioning.

Let's create all PV using this ``9-sts-pv.yaml`` yaml file:
```yaml
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-nfs-pv0
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 200Mi
  accessModes:
    - ReadWriteOnce
  nfs:
    server: node1
    path: "/srv/nfs/kubedata/pv0"
---
# repeated 4 times with /srv/nfs/kubedata/pv1, /srv/nfs/kubedata/pv2...
```
```bash
kubectl create -f 9-sts-pv.yaml
```

### Create Statefulset

We don't need to create the PVC manually, this will be done by the statefulset.

Let's create the statefulset using this ``9-sts-nginx.yaml`` file:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-headless   # this headless service is mandatory
  labels:                # it will allow all pods of the statefulset to known and connect each other
    run: nginx-sts-demo  # and guarantee a unique network identity for each pod
spec:
  ports:
  - port: 80
    name: web
  clusterIP: None
  selector:
    run: nginx-sts-demo
---
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: nginx-sts
spec:
  serviceName: "nginx-headless"   # this must be the same as above
  replicas: 4                     # statefulset will have 4 replicas
  #podManagementPolicy: Parallel  # by default if is Ordered
  selector:
    matchLabels:
      run: nginx-sts-demo
  template:
    metadata:
      labels:
        run: nginx-sts-demo
    spec:
      containers:              
      - name: nginx             # we're deploying ngnix containers
        image: nginx
        volumeMounts:           # it requires a volume
        - name: www             # called www-[0-4]
          mountPath: /var/www/  # mounted here
  volumeClaimTemplates:
  - metadata:                   # here is the PVC
      name: www                 # called www-[0-4]
    spec:
      storageClassName: manual  # will match the PV we've created above
      accessModes:
        - ReadWriteOnce         # each pod will have its own PV, so ReadWriteOnce is ok
      resources:
        requests:
          storage: 100Mi
```
```bash
kubectl create -f 9-sts-nginx.yaml
```

Let let's have a look and PVs and PVCs:
```bash
kubectl get pv,pvc
```
```text
NAME                          CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM                     STORAGECLASS   REASON   AGE
persistentvolume/pv-nfs-pv0   200Mi      RWO            Retain           Bound       default/www-nginx-sts-1   manual                  75s
persistentvolume/pv-nfs-pv1   200Mi      RWO            Retain           Bound       default/www-nginx-sts-2   manual                  75s
persistentvolume/pv-nfs-pv2   200Mi      RWO            Retain           Available                             manual                  75s
persistentvolume/pv-nfs-pv3   200Mi      RWO            Retain           Bound       default/www-nginx-sts-3   manual                  75s
persistentvolume/pv-nfs-pv4   200Mi      RWO            Retain           Bound       default/www-nginx-sts-0   manual                  75s

NAME                                    STATUS   VOLUME       CAPACITY   ACCESS MODES   STORAGECLASS   AGE
persistentvolumeclaim/www-nginx-sts-0   Bound    pv-nfs-pv4   200Mi      RWO            manual         61s
persistentvolumeclaim/www-nginx-sts-1   Bound    pv-nfs-pv0   200Mi      RWO            manual         55s
persistentvolumeclaim/www-nginx-sts-2   Bound    pv-nfs-pv1   200Mi      RWO            manual         49s
persistentvolumeclaim/www-nginx-sts-3   Bound    pv-nfs-pv3   200Mi      RWO            manual         39s
```

Let's create a file in /var/www directory of the ``nginx-sts-2`` pod: 
```bash
kubectl exec nginx-sts-2 -- touch /var/www/hello
kubectl exec nginx-sts-2 -- ls /var/www
```
```text
hello
```

Now if ever ``nginx-sts-2`` pod gets killed:
```bash
kubectl delete pod nginx-sts-2
```
Then a few seconds later (see in watch...) it is created again by kubernetes it is it still containing hello:
```bash
kubectl exec nginx-sts-2 -- ls /var/www
```
```text
hello
```
Now let's delete the statefulset
```bash
# this is because, per k8s doc, there is no guarantee the delete sts will actually delete all pods
kubectl scale sts nginx-sts --replicas=0
kubectl delete sts nginx-sts
```
You also have to delete PVCs and PVs manually:
```bash
kubectl delete pvc --all
kubectl delete pv --all
```
And delete the headless service too:
```bash
kubectl delete service nginx-headless
```

## Dynamically provision NFS persistent volumes

There are two approaches:
* NFS provisioner: deploying an NFS server in Kubernetes
* NFS client provisioner: installing an NFS server accessible from Kubernetes

It looks like there are many options out there:
* Rook NFS provisioner: https://rook.io/docs/rook/master/nfs.html
* Quay.io NFS provisioner: https://quay.io/repository/kubernetes_incubator/nfs-provisioner
* Quay.io NFS client provisioner:  https://quay.io/repository/external_storage/nfs-client-provisioner

As there is a Helm chart for the last one, let's go for it:

https://hub.helm.sh/charts/stable/nfs-client-provisioner 

The Helm chart will automate the procedure described in this video:

https://youtu.be/AavnQzWDTEk?t=448

### Warning

On my cluster (?) that provisioner does not seem to be very reliable actually removing PVs with
``Delete`` reclaim policy.

### Install NFS server

Let's install an NFS server on node1 using this ``site3.yaml`` playbook:
```yaml
---
- hosts: node1
  become: yes
  vars:
    nfs_exports:
    - "/srv/nfs/kubedynamic *(rw,sync)"
  tasks:
    - file: path=/srv/nfs/kubedynamic mode=0777 state=directory
  roles:
    - geerlingguy.nfs
```
```bash
# if not done already
sudo ansible-galaxy install geerlingguy.nfs
ansible-playbook site3.yaml
```
And install NFS client on all machines:
```bash
ansible k8s -b -m apt -a "name=nfs-common state=present"
```
### Install the provisioner

Create a namespace (optional):
```bash
kubectl create ns 
```
Install the chart by providing the NFS server hostname and share:
```bash
helm install -n nfs-client-provisioner  --set nfs.server=node1,nfs.path=/srv/nfs/kubedynamic,storageClass.archiveOnDelete=false  nfs-client-provisioner stable/nfs-client-provisioner
```
It will create a some stuff:
```bash
kubectl -n nfs-client-provisioner get clusterrole,clusterrolebinding,role,rolebinding,pods,deploy,rs | grep nfs
```
```text
clusterrole.rbac.authorization.k8s.io/nfs-client-provisioner-runner                                          11m
clusterrolebinding.rbac.authorization.k8s.io/run-nfs-client-provisioner                             11m
role.rbac.authorization.k8s.io/leader-locking-nfs-client-provisioner   11m
rolebinding.rbac.authorization.k8s.io/leader-locking-nfs-client-provisioner   11m
pod/nfs-client-provisioner-7658d8d9db-67gn8   1/1     Running   0          11m
deployment.apps/nfs-client-provisioner   1/1     1            1           11m
replicaset.apps/nfs-client-provisioner-7658d8d9db   1         1         1       11m
```
### Install the provisioner with MongoDB compatible options:

You might want to provide additional options for MongoDB using this ``nfs-client-provisioner-values.yaml`` Helm values file:
```yaml
nfs:
  server: node1
  path: /srv/nfs/kubedynamic
  mountOptions: [ bg, nolock, noatime ] # recommended mount options
storageClass:
  archiveOnDelete: false
  defaultClass: true
  # you might want to prevent the provisioner from auto deleting mongo volumes...
  # reclaimPolicy: Retain
```
```bash
helm install -n nfs-client-provisioner -f nfs-client-provisioner-values.yaml nfs-client-provisioner stable/nfs-client-provisioner
```

### Define NFS as the default storage class

After the installation we have a new storage class on your cluster:
```bash
kubectl get storageclasses
```
```text
NAME         PROVISIONER                            RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
nfs-client   cluster.local/nfs-client-provisioner   Delete          Immediate           true                   31s
```

If we describe it, we can see that it is not the default class:
```bash
kubectl describe storageclasses.storage.k8s.io nfs-client | grep IsDefaultClass
```
```text
IsDefaultClass:        No
```
We can make it the default one (that was the ``storageClass.defaultClass`` option of the chart):
```bash
kubectl patch storageclass nfs-client -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```

### Demo

First have a look at the existing volumes:
```bash
kubectl get pv | grep -E "CAPACITY|nfs-client"
```
There should be no volume like that.

Create the a pvc using this ``nfs-demo-pvc.yaml`` manifest:
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nfs-demo-pvc
spec:
  # optional now nfs-client is the default storage class
  #storageClassName: nfs-client
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 100Mi
```
```bash
kubectl create -f nfs-demo-pvc.yaml
```
Now have look at the existing volumes and claims:
```bash
kubectl get pv | grep -E "CAPACITY|nfs-client"
kubectl get pvc | grep -E "CAPACITY|nfs-client"
```
```text
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM                                                STORAGECLASS           REASON   AGE
pvc-9f622180-4789-4e26-bdd4-41f07294fab4   100Mi      RWO            Delete           Bound       default/nfs-demo-pvc                                 nfs-client                      2m3s
```
```text
NAME                                         STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS           AGE
nfs-demo-pvc                                 Bound    pvc-9f622180-4789-4e26-bdd4-41f07294fab4   100Mi      RWO            nfs-client             3m14s
```
So the PV has automatically been created.

We can see that a new directory has been created on the NFS server:
```bash
ansible node1 -a "ls /srv/nfs/kubedynamic"
```
```text
node1 | CHANGED | rc=0 >>
default-nfs-demo-pvc-pvc-9f622180-4789-4e26-bdd4-41f07294fab4
```

You can create a busybox pod using the pvc and play with the ``/mydata`` directory:
```bash
kubectl create -f nfs-demo-pod.yaml
kubectl -n mongodb wait pod/busybox --for=condition=Ready --timeout=-1s
kubectl exec -it busybox -- sh
touch /mydata/hello
exit
kubectl delete pod busybox
```

And if we delete the claim then the volume is deleted and the directory is deleted on the NFS server:
```bash
kubectl delete pvc nfs-demo-pvc
```


## Create a Secret based on existing Docker credentials

https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/

Let's create a secret containing your dockerhub credentials: 
```bash
kubectl create secret docker-registry dockerhub --docker-server=https://index.docker.io/v1/ --docker-username=<your-username> --docker-password=<your-password> --docker-email=<your-email>
```
Now you can create pods with your private images ``5-dockerhub-secret-pod.yaml``:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: yourapp
spec:
  containers:
    - name: yourapp
      image: yourorganisation/yourapp:latest
  imagePullSecrets:
    - name: dockerhub
```

## Config maps

config maps let you define variables that you can use in your pods.

It looks pretty much like secrets: [Secrets](#secrets)

List config maps:
```bash
kubectl get configmaps 
kubectl get cm 
```
Let's create our first config map using the ``6-configmap-1.yaml`` file:
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: demo-configmap
data:
  channel.name: "justmeandopensource"
  channel.owner: "Venkat Nagappan"
```
```bash
kubectl create -f 6-configmap-1.yaml 
```
Or you can create them using command-line:
```bash
kubectl create configmap demo-configmap-1 --from-literal=channel.name=justme --from-literal=channel.owner=me
```

Then you can create a pod using the config map ``6-pod-configmap-env.yaml``:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: busybox
spec:
  containers:
  - image: busybox
    name: busybox
    command: ["/bin/sh"]
    args: ["-c", "sleep 600"]
    env:
    - name: CHANNELNAME           # define CHANNELNAME env variable...
      valueFrom:                  # from...
        configMapKeyRef:          # configmap...
          name: demo-configmap    # called demo-configmap...
          key: channel.name       # and its channel.name key
    - name: CHANNELOWNER
      valueFrom:
        configMapKeyRef:
          name: demo-configmap
          key: channel.owner
```
```bash
kubectl create -f 6-pod-configmap-env.yaml
```

Then display the CHANNELNAME:
```bash
kubectl exec busybox -- sh -c "echo \$CHANNELNAME"
```
```text
justmeandopensource
```

```bash
kubectl delete pod busybox
```

You can also mount config maps as volumes ``6-pod-configmap-volume.yaml``:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: busybox
spec:
  volumes:                     # container needs a volume
  - name: demo                 # any name
    configMap:                 # created from a config map
      name: demo-configmap     # called demo-configmap
  containers:
  - image: busybox
    name: busybox
    command: ["/bin/sh"]
    args: ["-c", "sleep 600"]
    volumeMounts:              # mount the volume
    - name: demo               # "any name"
      mountPath: /mydata       # here
```
```bash
kubectl create -f 6-pod-configmap-volume.yaml 
```
Then it will create one file per variable:
```bash
kubectl exec busybox -- sh -c "ls /mydata"
```
```text
channel.name
channel.owner
```
Like secrets, if you update a configmap, files will be updated in the pod almost in realtime.

You can put files in a config map, for instance this ``my.cnf`` conf file:
```ini
[mysqld]
pid-file	= /var/run/mysqld/mysqld.pid
socket		= /var/run/mysqld/mysqld.sock
port		= 9999
datadir		= /var/lib/mysql
default-storage-engine = InnoDB
character-set-server = utf8
bind-address		= 127.0.0.1
general_log_file        = /var/log/mysql/mysql.log
log_error = /var/log/mysql/error.log
```
```bash
kubectl create cm mysql-demo-config --from-file=my.cnf
```
You can also create it using this ``6-configmap-2.yaml`` file (although it's weird):
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: mysql-demo-config
data:
  my.cnf: |  # the pipe sign allows for multi-line string
    [mysqld]
    pid-file        = /var/run/mysqld/mysqld.pid
    socket          = /var/run/mysqld/mysqld.sock
    port            = 3306
    datadir         = /var/lib/mysql
    default-storage-engine = InnoDB
    character-set-server = utf8
    bind-address            = 127.0.0.1
    general_log_file        = /var/log/mysql/mysql.log
    log_error = /var/log/mysql/error.log
```

Then you can create pod using the ``6-pod-configmap-mysql-volume.yaml`` file:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: busybox
spec:
  volumes:                     # container needs a volume
  - name: mysql-config         # any name
    configMap:                 # created from a configmap
      name: mysql-demo-config  # called mysql-demo-config 
      items:
        - key: my.cnf          # by saving the value of the my.cnf key
          path: my.cnf         # as this filename
  containers:
  - image: busybox
    name: busybox
    command: ["/bin/sh"]
    args: ["-c", "sleep 600"]
    volumeMounts:              # mount the volume
    - name: mysql-config       # "any name"
      mountPath: /mydata       # here (and files will be created here)
```
```bash
kubectl create -f 6-pod-configmap-mysql-volume.yaml
```

Then:
```bash
kubectl exec busybox -- sh -c "cat /mydata/my.cnf"
```
```text
[mysqld]
pid-file	= /var/run/mysqld/mysqld.pid
socket		= /var/run/mysqld/mysqld.sock
etc...
```

Cleanup:
```bash
kubectl delete pod busybox
```

## Resource quotas and limits

https://youtu.be/4C-0idGOi2A?t=151

It is used to prevent a particular user from using the entire cluster capacity.

Resource quotas apply to namespaces. The following example is about memory but
you have CPU limits as well. 

Let's create a namespace:
```bash
kubectl create ns quota-demo-ns
```
### Limit number of pods (etc...) in a namespace

You can prevent from creating more than 2 pods and 1 configmap using the ``7-quota-count.yaml`` file:
```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: quota-demo1
  namespace: quota-demo-ns
spec:
  hard:
    pods: "2"
    configmaps: "1"
```
```bash
kubectl create -f 7-quota-count.yaml 
```

Now create a configmap and check the quota to see where you stand wrt to quotas:
```bash
kubectl -n quota-demo-ns create configmap myconf --from-literal=key=value
kubectl -n quota-demo-ns describe quota quota-demo1
```
```text
Name:       quota-demo1
Namespace:  quota-demo-ns
Resource    Used  Hard
--------    ----  ----
configmaps  1     1
pods        0     2
```
Of course if you try to create more than 1 configmap, or more than 2 pods you'll get an error.

But there is a subtle behavior though: you will not get a error if you try to **scale** an existing deployment with --replicas=3,
but the number of pods will stick to 2 and you will have some warnings here and there 
```bash
kubectl -n quota-demo-ns create -f 1-nginx-deployment.yaml 
kubectl -n quota-demo-ns scale deployment nginx-deploy --replicas=3
```
Shows a deployment with DESIRED count that is below the CURRENT count(watch...):
```text
NAME                                      DESIRED   CURRENT   READY   AGE     CONTAINERS   IMAGES   SELECTOR
replicaset.apps/nginx-deploy-6db489d4b7   3         2         2       2m57s   nginx        nginx    pod-template-hash=6db489d4b7,run=nginx
```
And if you describe the replicaset you will see a "quota exceeded" warning:
```bash
kubectl -n quota-demo-ns describe replicasets.apps nginx-deploy-6db489d4b7  | tail -n1
```
```text
Warning  FailedCreate      87s (x7 over 4m8s)  replicaset-controller  (combined from similar events): Error creating: pods "nginx-deploy-6db489d4b7-zx9lk" is forbidden: exceeded quota: quota-demo1, requested: pods=1, used: pods=2, limited: pods=2
```
Cleanup:
```bash
kubectl -n quota-demo-ns delete quota quota-demo1
kubectl -n quota-demo-ns delete -f 1-nginx-deployment.yaml 

```

### Limit the memory for a namespace

You can limit the memory to 500 Mi using the ``7-quota-mem.yaml`` file:
```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: quota-demo-mem
  namespace: quota-demo-ns
spec:
  hard:
    limits.memory: "500Mi"  # all your pods collectively can't go beyond 500Mi
```
```bash
kubectl create -f 7-quota-mem.yaml
```
Now if you try to create the simplest pod, it will fail:
```bash
kubectl -n quota-demo-ns create -f 1-nginx-pod.yaml
```
```text
Error from server (Forbidden): error when creating "1-nginx-pod.yaml": pods "nginx" is forbidden: failed quota: quota-demo-mem: must specify limits.memory
```
That's because now you need to specify a limit for you pod. Let's do it with the ``7-pod-quota-mem.yaml`` file:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  namespace: quota-demo-ns
spec:
  containers:
    - image: nginx
      name: nginx
      resources:
        limits:              # set a limit
          memory: "100Mi"    # on memory allocation for the pod
```
Now if you describe the quota:
```bash
kubectl -n quota-demo-ns describe quota quota-demo-mem 
```
```text
Name:          quota-demo-mem
Namespace:     quota-demo-ns
Resource       Used   Hard
--------       ----   ----
limits.memory  100Mi  500Mi
```
You don't have to specify a limit for each pod though. 
You can create a limit range with the ``7-quota-limitrange.yaml`` file:
```yaml

apiVersion: v1
kind: LimitRange
metadata:
  name: mem-limitrange
  namespace: quota-demo-ns
spec:
  limits:
  - default:
      memory: 300Mi    # 300 Mi memory allowed for the namespace??
    defaultRequest:    # each time something is requesting memory
      memory: 50Mi     # it will be allocated 50Mi
    type: Container    # "something" is a container
```
```bash
kubectl create -f 7-quota-limitrange.yaml
```
That will have the effect of adding a ``resource`` section (to containers that don't have any?):
```yaml
      resources:
        limits:        
          memory: "50Mi"
```
This is different from this:
```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: quota-demo-mem
  namespace: quota-demo-ns
spec:
  hard:
    limits.memory: "500Mi"  # all your pods collectively can't go beyond 500Mi
    requests.memory: "100Mi"  # a request can't go beyond 100Mi (but can be lower)
```
There is also a notion of limit and request for the pod:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  namespace: quota-demo-ns
spec:
  containers:
    - image: nginx
      name: nginx
      resources:
        limits:            # bad things will happen beyond limits:
          memory: "100Mi"    # pod will be killed if going above 100Mi
          cpu: 1             # pod will be throttled if going above 1 CPU core usage
        requests:          # this is probably for scheduling purpose
          memory: "50Mi"     # your pod should use around 50Mi
          cpu: 500m          # your pod should use 500 milli shares of the CPU core
```
This article is interesting: https://sysdig.com/blog/kubernetes-limits-requests/

We learn that you can allow (and limit) overcommit on your nodes and the conclusion is:

*Some lessons you should learn from this are:*

* *Dear developer, set requests and limits in your workloads.*
* *Beloved cluster admin, setting a namespace quota will enforce all of the workloads in the namespace to have a request and limit in every container.*

*Quotas are a necessity to properly share resources. If someone tells you that you can use any shared service without limits, they are either lying or the system will eventually collapse, to no fault of your own.* 


## Performing Rolling Updates of applications

https://youtu.be/MoyixCuN3UQ?t=174

A rolling update consists in iteratively stopping a replica from a replicaset, then replacing it with a new version 
until all replicas have been updated. During that operation Kubernetes is ensuring there is no downtime of the app.

### Update

That can be done using specific deployment options like in the  ``8-nginx-rolling-update.yaml`` file:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    run: nginx
  name: nginx-deploy
spec:
  replicas: 4               # we start from 4 replicas
  selector:
    matchLabels:
      run: nginx
  strategy:                 # new update related options, those are k8s default options:
    type: RollingUpdate     # we want a rolling update (other option is Recreate that is good for dev envs)
    rollingUpdate:          # update options (there exists some methods based on readiness probes)
      maxSurge: 0           # during the update there can't be more than replicas+maxSurge pods (can be a %)
      maxUnavailable: 1     # during the update 1 pod can be unavailable (can be a %)
  minReadySeconds: 5        # wait 10 seconds after starting a new pod, before updating the next one
  revisionHistoryLimit: 10  # by default K8s keeps the last 10 versions (in addition to current version)
  template:
    metadata:
      labels:
        run: nginx
    spec:
      containers:
      - image: nginx:1.14
        name: nginx
```
```bash
kubectl create -f 8-nginx-rolling-update.yaml
```
Once the deployment is done, change the version of the image to:
```yaml
      - image: nginx:1.14.2
```
Then start the rolling update with:
```bash
kubectl apply -f 8-nginx-rolling-update.yaml
```
And you can see Kubernetes creating another replicaset and starting to replace the first pod:
```text
NAME                                READY   STATUS              RESTARTS   AGE     IP             NODE    NOMINATED NODE   READINESS GATES
pod/nginx-deploy-54b45bcb99-gckvp   0/1     ContainerCreating   0          3s      <none>         node2   <none>           <none>
pod/nginx-deploy-5cf565498c-84fxz   1/1     Running             0          4m12s   10.233.92.91   node3   <none>           <none>
pod/nginx-deploy-5cf565498c-bw6sz   1/1     Running             0          4m12s   10.233.96.15   node2   <none>           <none>
pod/nginx-deploy-5cf565498c-nm72b   1/1     Running             0          4m12s   10.233.90.96   node1   <none>           <none>
pod/nginx-deploy-5cf565498c-rbbpz   0/1     Terminating         0          4m12s   10.233.92.92   node3   <none>           <none>

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS   IMAGES         SELECTOR
deployment.apps/nginx-deploy   3/4     1            3           4m13s   nginx        nginx:1.14.2   run=nginx

NAME                                      DESIRED   CURRENT   READY   AGE     CONTAINERS   IMAGES         SELECTOR
replicaset.apps/nginx-deploy-54b45bcb99   1         1         0       4s      nginx        nginx:1.14.2   pod-template-hash=54b45bcb99,run=nginx
replicaset.apps/nginx-deploy-5cf565498c   3         3         3       4m13s   nginx        nginx:1.14     pod-template-hash=5cf565498c,run=nginx
```
Then the second:
```text
NAME                                READY   STATUS        RESTARTS   AGE     IP             NODE    NOMINATED NODE   READINESS GATES
pod/nginx-deploy-54b45bcb99-gckvp   1/1     Running       0          10s     10.233.96.16   node2   <none>           <none>
pod/nginx-deploy-54b45bcb99-gqcbn   0/1     Pending       0          0s      <none>         node3   <none>           <none>
pod/nginx-deploy-5cf565498c-84fxz   1/1     Running       0          4m19s   10.233.92.91   node3   <none>           <none>
pod/nginx-deploy-5cf565498c-bw6sz   1/1     Terminating   0          4m19s   10.233.96.15   node2   <none>           <none>
pod/nginx-deploy-5cf565498c-nm72b   1/1     Running       0          4m19s   10.233.90.96   node1   <none>           <none>
pod/nginx-deploy-5cf565498c-rbbpz   0/1     Terminating   0          4m19s   10.233.92.92   node3   <none>           <none>

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE     SELECTOR
service/kubernetes   ClusterIP   10.233.0.1   <none>        443/TCP   6d22h   <none>

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS   IMAGES         SELECTOR
deployment.apps/nginx-deploy   4/4     1            4           4m19s   nginx        nginx:1.14.2   run=nginx

```
etc... In the end you have 4 new pods and 2 replicasets:

```text
NAME                                READY   STATUS    RESTARTS   AGE     IP             NODE    NOMINATED NODE   READINESS GATES
pod/nginx-deploy-54b45bcb99-4gtlb   1/1     Running   0          2m51s   10.233.92.94   node3   <none>           <none>
pod/nginx-deploy-54b45bcb99-cz8bw   1/1     Running   0          3m5s    10.233.90.97   node1   <none>           <none>
pod/nginx-deploy-54b45bcb99-gckvp   1/1     Running   0          3m25s   10.233.96.16   node2   <none>           <none>
pod/nginx-deploy-54b45bcb99-gqcbn   1/1     Running   0          3m15s   10.233.92.93   node3   <none>           <none>

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS   IMAGES         SELECTOR
deployment.apps/nginx-deploy   4/4     4            4           7m34s   nginx        nginx:1.14.2   run=nginx

NAME                                      DESIRED   CURRENT   READY   AGE     CONTAINERS   IMAGES         SELECTOR
replicaset.apps/nginx-deploy-54b45bcb99   4         4         4       3m25s   nginx        nginx:1.14.2   pod-template-hash=54b45bcb99,run=nginx
replicaset.apps/nginx-deploy-5cf565498c   0         0         0       7m34s   nginx        nginx:1.14     pod-template-hash=5cf565498c,run=nginx
```
If you delete the old replicaset (last line) you will loose the ability to rollback the deployment.

You can get the status of a rollout (during a rollout this command will not return
 immediatly and show the progress of the rollout):
```bash
kubectl rollout status deployment nginx-deploy
```
```text
deployment "nginx-deploy" successfully rolled out
```
You can get the history of a rollout:
```bash
kubectl rollout history deployment nginx-deploy
```
```text
deployment.apps/nginx-deploy 
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
```
Now let's do a rolling update using the command-line:
```bash
kubectl set image deployment nginx-deploy nginx=nginx:1.15
```
Rollout history is now:
```bash
kubectl rollout history deployment nginx-deploy
```
```text
deployment.apps/nginx-deploy 
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
3         <none>
```
You can have details on revisions:
```bash
kubectl rollout history deployment nginx-deploy --revision=1
```
```text
deployment.apps/nginx-deploy with revision #1
Pod Template:
  Labels:	pod-template-hash=5cf565498c
	run=nginx
  Containers:
   nginx:
    Image:	nginx:1.14
    Port:	<none>
    Host Port:	<none>
    Environment:	<none>
    Mounts:	<none>
  Volumes:	<none>
```
Now let's speed up the rollout by allowing more pods that can be allocated and less : 

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    run: nginx
  name: nginx-deploy
spec:
  replicas: 4               
  selector:
    matchLabels:
      run: nginx
  strategy:                
    type: RollingUpdate    
    rollingUpdate:         
      maxSurge: 2           # during the update you can have 2 extra pods
      maxUnavailable: 2     # during the update 2 pods can be unavailable
  minReadySeconds: 5        
  revisionHistoryLimit: 10  
  template:
    metadata:
      labels:
        run: nginx
    spec:
      containers:
      - image: nginx:1.15
        name: nginx
```
```bash
kubectl apply -f 8-nginx-rolling-update3.yaml
```
And before the last rollout, we want to add a change cause in our revision history:
```bash
kubectl annotate deployment nginx-deploy kubernetes.io/change-cause="Updated to latest version"
```
Then update nginx to the latest version:
```bash
kubectl set image deployment nginx-deploy nginx=nginx:latest
```
Rollout history is now (strange):
```bash
kubectl rollout history deployment nginx-deploy
```
```text
deployment.apps/nginx-deploy 
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
3         Updated to latest version
4         Updated to latest version
```
So we probably need to call this annotate before the rollout.

You can also use the ``--record`` option to save the entire command in the change cause:
```bash
kubectl set image deployment nginx-deploy nginx=nginx:1.17 --record
kubectl rollout history deployment nginx-deploy
```
```text
deployment.apps/nginx-deploy 
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
3         Updated to latest version
4         Updated to latest version
5         kubectl set image deployment nginx-deploy nginx=nginx:1.17 --record=true
```

You can also set this annotation in the deployment yaml file:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    kubernetes.io/change-cause: "Updated to version N"
  labels:
    run: nginx
  name: nginx-deploy
```
Cleanup:
```bash
kubectl delete deployments.apps nginx-deploy
```

### Rollback

Now let's try to rollback a deployment:
```bash
kubectl rollout undo deployment nginx-deploy --to-revision=3
```
Without ``--to-revision`` option it rollbacks to the previous version.
```text
deployment.apps/nginx-deploy 
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
4         Updated to latest version 
5         kubectl set image deployment nginx-deploy nginx=nginx:1.17 --record=true
6         Updated to latest version
```

### Pausing and resume=ing a rollout


Pause:
```bash
kubectl rollout pause deployment nginx-deploy
```
Resume:
```bash
kubectl rollout resume deployment nginx-deploy
```

## Renaming nodes

https://www.youtube.com/watch?v=TqoA9HwFLVU

(not watched yet)

## How to upgrade your Kubernetes Cluster

https://www.youtube.com/watch?v=-MZ-l2HG368

(not watched yet)

## Setting up Rancher

https://www.youtube.com/watch?v=jF5L6IgZ5To

Unlike the Kubernetes Dashboard, Rancher can manage multiple clusters.

Rancher is a docker container that you will install on another machine.

```bash
docker run -d --name rancher --restart=unless-stopped -p 80:80 -v /opt/rancher:/var/lib/rancher -p 443:443 rancher/rancher
```
Once up, open: https://localhost/ 

You are required to provide:
 * a password
 * Rancher Server URL: make sure that URL is accessible from the nodes of the cluster

The select "create cluster" and "existing cluster".

Then Rancher will ask you to run a kubectl command on the cluster, something like this:
```bash
kubectl apply -f https://mylaptop/v3/import/j5vz82trdj2hqxkjnbcqw7xnbbtxwddbxcdltbnzbbnsd2n948npgm.yaml
```
And if you don't a valid SSL certificate, run:
```bash
curl --insecure -sfL https://mylaptop/v3/import/j5vz82trdj2hqxkjnbcqw7xnbbtxwddbxcdltbnzbbnsd2n948npgm.yaml | kubectl apply -f -
```
Then you can watch the deployment progress:
```bash
watch kubectl -n cattle-system get all -o wide 
```
After 5 minutes (time to download images) you should be done.

After that you'll have a nice dashboard and you can:
* and you can type your kubectl commands in the web browser 
* create deployments, 
* scale pods, 
* execute shells on pods,
* see container logs,
* see cluster events... 

It is very nice.

## Monitoring Kubernetes Cluster with Rancher 

Then you can continue with this video showing how to install monitoring tools (Prometheus and Grafana) in 1 click.

https://youtu.be/-xEGoiCXavw?t=473

Grafana dashboards are incredibly rich.

But you don't really need to access grafana itself. The simple fact of activating monitoring
will make Rancher UI look different and richer.

## Kubernetes Logging with Rancher, Fluentd and Elastic Stack
 
https://youtu.be/PZHEgNKORbY

(not tested yet)
 
That video shows the 1-click install and configuration of Fluentd so all Docker logs are redirected to Elasticsearch.
 
That solultion is assuming that containers log to stdout which (according to https://logging.apache.org/log4j/2.x/manual/cloud.html)
is *the least common denominator [...] guaranteed to work for all applications. However, as with any set of general guidelines, choosing the least common denominator approach comes at a cost.*

The video does not describe how to install Elasticsearch & Kibana inside K8s: they are installed on a non-cluster machine using docker-compose.

But still, implementing that solution is a matter if "docker-compose up -d" and 2 clicks in the Rancher UI.

## Kubernetes alerts to Slack with Rancher

https://www.youtube.com/watch?v=SQH8NukORJM

(not tested yet)

Rancher has an **Alerts** entry in the **Tools** menu with predefined system alerts:
* high number of leader change 
* Node disk is running full within 24h
* High cpu load
* High node memory utilization
* etc...

There are also alerts per namespace.

Rules are based on Prometheus so you have the enable metrics: see [Monitoring Kubernetes Cluster with Rancher](#monitoring-kubernetes-cluster-with-rancher)

You can create custom rules based on prometheus metrics.

You can create notifiers with the **Notifiers** entry in the **Tools** menu. There are several options:
* Slack
* email
* webhooks
* etc...

## Set up Nginx Ingress in Kubernetes Bare Metal

https://youtu.be/chwofyGr80c

When you're opening a Kubernetes service to the outside world, you could use ``NodePort`` services and tell
users to target any node IP but what will happen if you want to decommission a node? This is where the notion 
of **Ingress** comes into play.

So far we mentioned ``ClusterIP``, ``NodePort`` and ``Headless`` services (used in statefulsets). 
There is another type of service: ``LoadBalancer``.

When you're creating a ``LoadBalancer`` service in a Kubernetes cluster in the cloud (Google GKE, Amazon EKS),
the cloud infrastructure will setup an load-balancer for you (Amazon ELB for instance). For bare metal cluster we have to take care of the load-balancing ourselves.

This is done by:
* creating a ``ClusterIP`` service for your application (instead of ``NodePort``)
* setting up an **Ingress Controller** on every node (it might be using a daemonset, but it is not required)
* deploying an **Ingress Resource**: those are basically rules (when a request arrives at this address, route it to this service)
* installing an HAProxy (for example) outside of the cluster, dispatching requests to all your nodes
* create a DNS entry for any service name you want to expose outside the cluster (myapp.example.com, otherapp.example.com) 
ant point all the entries to the HAProxy address

In that scenario HAProxy will dispatch all requests to nodes of the cluster, and the Ingress controller of each node
will dispatch the request to the appropriate service: the controller will see that the request was for myapp.example.com,
it will read the rules defined in Ingress Resource and dispatch the request to the appropriate service.

There are several options for the **Ingress Controller** like Nginx or Traefik.

### Install and configure HAProxy

Let's install HAProxy on our laptop using this ``haproxy.yml`` Ansible playbook:
```yaml
- hosts: localhost
  become: yes
  vars:
    haproxy_frontend_name: 'hafrontend'
    haproxy_frontend_bind_address: '*'
    haproxy_frontend_port: 80
    haproxy_frontend_mode: 'http'
    haproxy_backend_name: 'habackend'
    haproxy_backend_mode: 'http'
    haproxy_backend_balance_method: 'roundrobin'
    haproxy_backend_servers:
      - name: kube
        address: node1:80
      - name: kube
        address: node2:80
      - name: kube
        address: node3:80
  roles:
    - { role: geerlingguy.haproxy }
```
```bash
sudo ansible-galaxy install geerlingguy.haproxy
ansible-playbook haproxy.yml
# little modification to the generated file
ansible localhost -b -m replace -a 'path=/etc/haproxy/haproxy.cfg regexp="(.+)cookie kube check" replace="\1"'
sudo service haproxy restart
```

### Remarks about NGINX Ingress Controllers

There are two NGINX ingress controllers: one developed by the Kubernetes community, 
one developed by NGINX Inc and community.

See the differences here:

https://github.com/nginxinc/kubernetes-ingress/blob/master/docs/nginx-ingress-controllers.md

One difference is the support of Websockets that requires a specific configuration with NGINX Inc.

Supported by Kubernetes : https://kubernetes.github.io/ingress-nginx/

Supported by NGINX: https://github.com/nginxinc/kubernetes-ingress

The video is about the latter. 

It looks like that topic is complex for a beginner (like me) since I don't event understand the 
first paragraph of this page about bare metal considerations:

https://kubernetes.github.io/ingress-nginx/deploy/baremetal/


### Install NGINX Inc Ingress controller 

Note: I've not managed to get it working with cert-mananger: see 

There are two ways of installing it: 
* Using Kubernetes manifests: https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-manifests/ 
* Using a Helm chart: https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/

The video is about the former.

```bash
git clone https://github.com/nginxinc/kubernetes-ingress/
cd kubernetes-ingress/deployments
git checkout v1.6.3
# Create a namespace and a service account for the Ingress controller:
kubectl apply -f common/ns-and-sa.yaml
# Create a cluster role and cluster role binding for the service account:
kubectl apply -f rbac/rbac.yaml
# Create a secret with a TLS certificate and a key for the default server in NGINX:
kubectl apply -f common/default-server-secret.yaml
# Create a config map for customizing NGINX configuration:
kubectl apply -f common/nginx-config.yaml
# Create custom resource definitions for VirtualServer and VirtualServerRoute resources:
kubectl apply -f common/custom-resource-definitions.yaml
```

At this point you have 2 options to deploy the Ingress Controller:
* either as a Deployment
* either as a DaemonSet

The video is about the latter:
```bash
# as a daemonset
kubectl apply -f daemon-set/nginx-ingress.yaml
```
After a few minutes, you have:
```bash
kubectl -n nginx-ingress get all
```
```text
pod/nginx-ingress-cl7p7   1/1     Running   0          7m34s
pod/nginx-ingress-hzthc   1/1     Running   0          7m34s
pod/nginx-ingress-p2q9w   1/1     Running   0          7m34s

NAME                           DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
daemonset.apps/nginx-ingress   3         3         3       3            3           <none>          7m34s
```
### Demo of  NGINX Inc Ingress controller 

Don't be confused by all those nginx: here we are going to deploy nginx pod that will
just serve static content. They could have been Apache server. 
Those will be our services that will be managed by our (nginx) ingress controller.
 
Let's start by a simple 1 replica deployment of nginx (like we used in examples above) and 
create a ClusterIP service:
```bash
kubectl create -f nginx-deploy-main.yaml
kubectl expose deployment nginx-deploy-main --port 80
```
Now we need to create an **Ingress Resource** with the ``ingress-resource-1.yaml`` manifest:
```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress  # it's an ingress
metadata:
  name: ingress-resource-1
spec:
  rules:                       # rules of the ingress
  - host: nginx.example.com    # every request targeting nginx.example.com
    http:                      # (http requests...)
      paths:                   # will be redirected
      - backend:               # to the backend
          serviceName: nginx-deploy-main   # implemented by the nginx-deploy-main service
          servicePort: 80                  # running on port 80
```
```bash
kubectl create -f ingress-resource-1.yaml
```
And you can see the ingress:
```bash
kubectl get ing
```
```text
NAME                 HOSTS               ADDRESS   PORTS   AGE
ingress-resource-1   nginx.example.com             80      50s
```
Now the last step is to create a DNS entry for nginx.example.com. 
Note that this DNS entry has to point to HAProxy, that's to say on localhost in this exemple.
We'll simply do that by editing our ``/etc/hosts`` file:
```bash
sudo ansible -b localhost -m lineinfile -a 'dest=/etc/hosts regexp=nginx.example.com line="127.0.0.1 nginx.example.com"'
```
And now let's try to connect to our main nginx deployment through HAProxy and NGINX Ingress controller:
```bash
curl nginx.example.com | grep title
``` 
```text
<title>Welcome to nginx!</title>
```
Now let's delete the ingress:
```bash
kubectl delete ing ingress-resource-1
```
If we try to connect once again we get a 404 error from the Ingress Controller:
```bash
curl nginx.example.com | grep title
```
```text
<head><title>404 Not Found</title></head>
```
Now let's create 2 other deployments simply consisting in nginx servers with an index.html 
page containing "I am blue" and "I am green" (intialized using an Init Container).
```bash
kubectl create -f nginx-deploy-blue.yaml
kubectl create -f nginx-deploy-green.yaml
``` 
Let's create a service for them:
```bash
kubectl expose deployment nginx-deploy-blue --port 80
kubectl expose deployment nginx-deploy-green --port 80
```
Finally let's create an Ingress Resource for main, blue and green using the ``ingress-resource-2.yaml`` manifest:
```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: ingress-resource-2
spec:
  rules:
  - host: nginx.example.com
    http:
      paths:
      - backend:
          serviceName: nginx-deploy-main
          servicePort: 80
  - host: blue.nginx.example.com
    http:
      paths:
      - backend:
          serviceName: nginx-deploy-blue
          servicePort: 80
  - host: green.nginx.example.com
    http:
      paths:
      - backend:
          serviceName: nginx-deploy-green
          servicePort: 80
```
```bash
kubectl create -f ingress-resource-2.yaml
```
Let's describe the ingress:
```bash
kubectl  describe ing ingress-resource-2 
```
```text
[...]
Rules:
  Host                     Path  Backends
  ----                     ----  --------
  nginx.example.com        
                              nginx-deploy-main:80 (10.233.92.108:80)
  blue.nginx.example.com   
                              nginx-deploy-blue:80 (10.233.96.27:80)
  green.nginx.example.com  
                              nginx-deploy-green:80 (10.233.92.109:80)
[...]
```

Add hosts to ``/etc/hosts`` file:
```bash
sudo ansible -b localhost -m lineinfile -a 'dest=/etc/hosts regexp=blue.nginx.example.com line="127.0.0.1 blue.nginx.example.com"'
sudo ansible -b localhost -m lineinfile -a 'dest=/etc/hosts regexp=green.nginx.example.com line="127.0.0.1 green.nginx.example.com"'
```
Then try to get our services:
```bash
curl blue.nginx.example.com | grep h1
```
```text
<h1>I am <font color=blue>BLUE</font></h1>
```
```bash
curl green.nginx.example.com | grep h1
```
```text
<h1>I am <font color=green>GREEN</font></h1>
```

### Uninstall NGINX Inc Ingress controller

Not tested but it should be:
```bash
kubectl delete ns nginx-ingress
```

For the moment we're only going to remove the daemonset:
```bash
kubectl delete -f daemon-set/nginx-ingress.yaml
```

## Install Traefik Ingress Controller

It looks like there are 3 options here: 
* Traefik v1: https://docs.traefik.io/v1.7/user-guide/kubernetes/
* Traefik v2: https://docs.traefik.io/providers/kubernetes-ingress/
* Traefik v2, custom resource way: https://docs.traefik.io/providers/kubernetes-crd/

Difficult to understand the differences for a beginner (like me).

### Install Traefik Ingress Controller v1.7

https://youtu.be/A_PjjCM1eLA?t=471

The YouTube video is showing the installation of v1:
```bash
# this will deploy stuf in the kube-system namespace
kubectl apply -f https://raw.githubusercontent.com/containous/traefik/v1.7/examples/k8s/traefik-rbac.yaml
```
At this point you have 2 options to deploy the Ingress Controller:
* either as a Deployment
* either as a DaemonSet

The video is about the latter.
```bash
# as a daemonset in the kube-system namespace
kubectl apply -f https://raw.githubusercontent.com/containous/traefik/v1.7/examples/k8s/traefik-ds.yaml
```

A few minutes later you have:
```bash
kubectl get all -n kube-system   | grep traefik
```
```text
pod/traefik-ingress-controller-jlshz           1/1     Running   0          117s
pod/traefik-ingress-controller-qklpc           1/1     Running   0          117s
pod/traefik-ingress-controller-rbw8t           1/1     Running   0          117s
service/traefik-ingress-service   ClusterIP   10.233.15.146   <none>        80/TCP,8080/TCP          117s
daemonset.apps/traefik-ingress-controller   3         3         3       3            3           <none>                                               118s
```
You can also have a look at Traefik dashboard exported (without any access control!) on the 8080 NodePort:

http://node1:8080/dashboard/

I can see that I've deployed the "v1.7.24 / maroilles" version :-)

Now if you have not removed containers and services created in the 
Demo of  NGINX Inc Ingress controller paragraph, then you'll directly have:

```bash
curl blue.nginx.example.com | grep h1
```
```text
<h1>I am <font color=blue>BLUE</font></h1>
```
```bash
curl green.nginx.example.com | grep h1
```
```text
<h1>I am <font color=green>GREEN</font></h1>
```

### Uninstall Traefik Ingress Controller v1.7

For the moment we're only going to remove the daemonset:
```bash
kubectl delete -f https://raw.githubusercontent.com/containous/traefik/v1.7/examples/k8s/traefik-ds.yaml
```

## Install Traefik Ingress Controller v2.2, custom resource way

Official documentation: https://docs.traefik.io/providers/kubernetes-crd/

https://blog.wescale.fr/2020/03/06/traefik-2-reverse-proxy-dans-kubernetes/

(not tested) 

That blog show the new way of installing Traefik v2. We can see that Traefik has a nice dashboard.

## Set up MetalLB Load Balancing for Bare Metal Kubernetes

Excerpt of the official documentation: https://metallb.universe.tf/

*Bare metal cluster operators are left with two lesser tools to bring user traffic into their clusters, “NodePort” and “externalIPs” services. Both of these options have significant downsides for production use, which makes bare metal clusters second class citizens in the Kubernetes ecosystem.*

*MetalLB aims to redress this imbalance by offering a Network LB implementation that integrates with standard network equipment, so that external services on bare metal clusters also “just work” as much as possible.*

It remains to know what are those downsides in order to know what kind of problem MetalLB is trying to solve.
It might be related to the fact that if you need to add a cluster node, you need to 
update you HAProxy configuration.

Excerpt of the maturity section: https://metallb.universe.tf/concepts/maturity/

*The majority of code changes, as well as the overall direction of the project, is a **personal endeavor of one person**, working on MetalLB in their spare time as motivation allows.*

*This means that, currently, support and new **feature development is mostly at the mercy of one person’s availability and resources**. You should set your expectations appropriately.*
 

https://youtu.be/xYiYIjlAgHY?list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0

### Intro
Let's deploy our good old nginx deployment (with 2 replicas):
```bash
kubectl create -f 1-nginx-deployment.yaml
```

Now let's create a service with the LoadBalancer type:
```bash
kubectl expose deployment nginx-deploy --port 80 --type LoadBalancer
```
Then the service will forever stay in the ``<pending>`` state because the cluster 
is not in the cloud and we have no such thing:
```text
service/nginx-deploy         LoadBalancer   10.233.37.204   <pending>     80:31613/TCP   13s    run=nginx
```
So remove it:
```bash
kubectl delete service nginx-deploy
```

### Install MetalLB

Per documentation the installation consists in:
```bash
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
```
Now let's have a look at the MetalLB namespace:
```bash
kubectl get all -n metallb-system
```
```text
NAME                              READY   STATUS    RESTARTS   AGE
pod/controller-5c9894b5cd-kh6q5   1/1     Running   0          99s
pod/speaker-7kfdl                 1/1     Running   0          100s
pod/speaker-9mrmw                 1/1     Running   0          100s
pod/speaker-f8z9d                 1/1     Running   0          100s

NAME                     DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR                 AGE
daemonset.apps/speaker   3         3         3       3            3           beta.kubernetes.io/os=linux   100s

NAME                         READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/controller   1/1     1            1           100s

NAME                                    DESIRED   CURRENT   READY   AGE
replicaset.apps/controller-5c9894b5cd   1         1         1       100s
```

The controller takes care of the address assignment: when you create a service of type LoadBalancer
this component assigns an IP address for the service.

Speakers make sure you can reach the service through the load balancer IP.
Speakers are deployed as a daemonset.

Now we need to configure MetalLB using the ``metallb-layer2-config.yaml`` config map:
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:  # change the address range so it is a free address range in your network, but in your subnet
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses: 
      - 192.168.1.200-192.168.1.250
```
```yaml
kubectl create -f metallb-layer2-config.yaml
```

### Demo

Now let's create a service with the LoadBalancer type once again:
```bash
kubectl expose deployment nginx-deploy --port 80 --type LoadBalancer
```
This time the LoadBalancer service has been created with the first address of our range (``192.168.1.240``):
```text
NAME                         TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)        AGE    SELECTOR
service/nginx-deploy         LoadBalancer   10.233.54.89    192.168.1.240   80:31968/TCP   10s    run=nginx
```
It means that you have to reserve a portion of your network for load-balancing.
Now we can access it:
```bash
curl 192.168.1.240 | grep title
```
```text
<title>Welcome to nginx!</title>
```
It is quite powerful indeed: we're not using any IP address of any node. 
So you can freely add and remove nodes from your cluster.

### Uninstall MetalLB

I tried this:
```yaml
kubectl delete ns metallb-system
```
But it was still possible to access:
```bash
curl 192.168.1.240
```
We'll see after a restart of the machines...

Still working after the restart of all machines (cluster nodes and laptop)!

We'll see after a restart of the router...

We won't see because I have deleted my ``LoadBalancer`` service:
```bash
kubectl delete service nginx-deploy
```
But still:
```bash
ping 192.168.1.240
```
```text
PING 192.168.1.240 (192.168.1.240) 56(84) bytes of data.
From 192.168.1.12: icmp_seq=2 Redirect Host(New nexthop: 192.168.1.240)
From 192.168.1.12: icmp_seq=3 Redirect Host(New nexthop: 192.168.1.240)
```

## Using Horizontal Pod Autoscaler

https://youtu.be/uxuyPru3_Lc

Kubernetes can detect CPU load and automatically increase the number of replicas of a replicaset.
Whene CPU utilization is going down, it will automatically reduce the number of replicas.

Kubernetes has a notion of **cooling period**: it will wait 3 minutes before taking any
scale-up action, and 5 minutes before any scale-down action. CPU utilization is measured
every 5 seconds.

This can be done by deploying an **Horizontal Pod Autoscaler** (HPA). HPA depends
on **metrics-server**, so it must installed in the cluster.

### Metrics-server installation

Official documentation: https://github.com/kubernetes-sigs/metrics-server

Check if metrics-server is installed with:
```bash
kubectl top pods
```
If you got an error, it is not installed.

The installation procedure described in the video is outdated.

```bash
wget -O metrics-server-component.yaml https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml
```
Then edit the file to add a ``--kubelet-insecure-tls`` command-line option to the metrics server container 
(this is a bad practise but that's ok for a demo cluster):
```yaml
      containers:
      - name: metrics-server
        image: k8s.gcr.io/metrics-server-amd64:v0.3.6
        imagePullPolicy: IfNotPresent
        args:
          - --cert-dir=/tmp
          - --secure-port=4443
          - --kubelet-insecure-tls     # new line
```
And finally apply the manifest:
```bash
kubectl create -f  metrics-server-component.yaml
```
It will create some stuff in the ``kube-system`` namespace.

After the installation the top command is running:
```bash
kubectl top pods
```
```text
NAME                                  CPU(cores)   MEMORY(bytes)   
nginx-deploy-6db489d4b7-5rzlp         0m           2Mi             
nginx-deploy-6db489d4b7-m8vvd         0m           2Mi             
nginx-deploy-blue-7979fc74d8-cbcnl    0m           3Mi             
nginx-deploy-green-7c67575d6c-5bnq5   0m           2Mi             
nginx-deploy-main-7cc547b6f7-j7dmk    0m           2Mi             
```
```bash
kubectl top nodes
```
```text
NAME    CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%     
node2   430m         11%    1267Mi          17%         
node3   283m         7%     1056Mi          6%          
node1   <unknown>                           <unknown>               <unknown>               <unknown>               
```
If you have many ``<unknown>`` problem, then you might want to edit the file to add a ``--kubelet-preferred-address-types`` command-line option to the metrics server container.
Possible values are: ``Hostname``, ``InternalDNS``, ``InternalIP``, ``ExternalDNS``, ``ExternalIP``

In my situation I don't understand the issue, but I guess it has something to do with this:

*So it was my fault. I have Bare Metal cluster so all my InternalIPs are external ones. But that was the node which hold the metrics server itself so it tried to request stats via internal source - external destination. Anyway - fixed my FW and now all is ok.*
https://github.com/kubernetes-sigs/metrics-server/issues/165  

I finally fixed it with ``--kubelet-preferred-address-types=InternalIP``

### Setup HPA demo

Let's create an nginx deployment with the ``10-nginx-deployment-cpulimit.yaml`` manifest and create a NodePort service:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    run: nginx
  name: nginx-deploy
spec:
  replicas: 1
  selector:
    matchLabels:
      run: nginx
  template:
    metadata:
      labels:
        run: nginx
    spec:
      containers:
        - image: nginx
          name: nginx
          resources:    # you MUST specify limits (either memory or cpu) to use HPA
            limits:
              cpu: "100m"  # 10% of a CPU core
            requests:
              cpu: "100m"  # 10% of a CPU core
```
```bash
kubectl create -f 10-nginx-deployment-cpulimit.yaml
kubectl expose deployment nginx-deploy --port 80 --type NodePort
kubectl describe svc nginx-deploy | grep NodePort
```
```text
NodePort:                 <unset>  32765/TCP
```
So now your nginx is accessible on http://node1:32765

Let's create the HPA using the ``10-hpa.yaml`` manifest:
```yaml
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: nginx-deploy
spec:
  maxReplicas: 5
  minReplicas: 1
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: nginx-deploy
  targetCPUUtilizationPercentage: 20
```
```bash
kubectl create -f 10-hpa.yaml
```
Or you can create it on command-line:
```bash
kubectl autoscale deployment nginx-deploy --min=1 --max=5 --cpu-percent=20
```
You can see the curent CPU usage and the target in the output of  ``kubectl get all -o wide``:
```text
NAME                                               REFERENCE                 TARGETS         MINPODS   MAXPODS   REPLICAS   AGE
horizontalpodautoscaler.autoscaling/nginx-deploy   Deployment/nginx-deploy   0%/20%    1         5         1          3m14s
```
If you see ``<unknown>/20% `` there is a problem (it happened to me when creating the HPA from the manifest instead of with the command-line):
```text
NAME                                               REFERENCE                 TARGETS         MINPODS   MAXPODS   REPLICAS   AGE
horizontalpodautoscaler.autoscaling/nginx-deploy   Deployment/nginx-deploy   <unknown>/20%   1         5         1          29s
```

If you don't specify limits on your deployment, you get this kind of (silent) error:
```bash
kubectl describe hpa nginx-deploy | grep ScalingActive
```
```text
ScalingActive  False   FailedGetResourceMetric  the HPA was unable to compute the replica count: missing request for cpu
```

### Demo HPA

First let's install **siege**:
```text
sudo apt install siege
```
Then let's put some load on our nginx:
```bash
siege -q -c 5 -t 2m http://node1:32765
```
A few seconds later you can see new pods appearing and the HPA above targets:
```text
NAME                                      READY   STATUS              RESTARTS   AGE
pod/nginx-deploy-64c97f587-j42dq          1/1     Running             0          23m
pod/nginx-deploy-64c97f587-zrgxz          0/1     ContainerCreating   0          6s
pod/nginx-deploy-64c97f587-ztsgb          1/1     Running             0          6s

NAME                         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/nginx-deploy         NodePort    10.233.48.97    <none>        80:32765/TCP   23m

NAME                                 READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx-deploy         2/3     3            2           23m

NAME                                            DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-deploy-64c97f587          3         3         2       23m

NAME                                               REFERENCE                 TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
horizontalpodautoscaler.autoscaling/nginx-deploy   Deployment/nginx-deploy   54%/20%   1         5         1          10m
```

However I've not been able to observe the scale-down (I waited 12 minutes after stopping siege).

Maybe it has something to do with metrics-server not able to get metrics from node1.

Yes it was!

After a correct metrics-server setup, it took 7 minutes but I've seen the HPA scaling down pods:
```text
NAME                                      READY   STATUS        RESTARTS   AGE     IP              NODE    NOMINATED NODE   READINESS GATES
pod/nginx-deploy-64c97f587-fs6dd          1/1     Terminating   0          6m51s   10.233.96.38    node2   <none>           <none>
pod/nginx-deploy-64c97f587-jc8rx          1/1     Running       0          9m21s   10.233.92.120   node3   <none>           <none>
```

Cleanup:
```bash
kubectl delete hpa nginx-deploy
kubectl delete svc nginx-deploy
kubectl delete deploy nginx-deploy
``` 

## Pod auto-scaling based on memory utilization

https://youtu.be/KS5MzK4EDg8

You can also use HPA to auto scale based on memory limits.

(not tested)


## Useful Tools - kube-ops-view and kubebox

https://youtu.be/auVLHYSZM_A

Both tools offer a nice alternative to:
```bash
watch kubectl get all -o wide
```

### kube-ops-view

It offers a nice old-school graphical overview you your cluster. 
It requires to install stuff in your cluster though.

(not tested)

### kubebox

Official site: https://github.com/astefanutti/kubebox

It is a command-line tool with a terminal UI like htop allowing to
browse in namespaces, pods, pods logs...

Install:
```bash
sudo curl -Lo /usr/local/bin/kubebox https://github.com/astefanutti/kubebox/releases/download/v0.8.0/kubebox-linux && sudo chmod +x /usr/local/bin/kubebox
```
It will work as is but it expects cAdvisor to be deployed as a DaemonSet in order to display CPU, RAM and Net pod metrics:
```bash
kubectl apply -f https://raw.github.com/astefanutti/kubebox/master/cadvisor.yaml
```

## Setup Let's Encrypt cert-manager in Kubernetes Bare Metal

I've not been able to get this setup working, so this paragraph is only here for history.

See [Deploy and use Nginx ingress controller](#deploy-and-use-nginx-ingress-controller) for a half-working demo 
(working with self-signed certificates, but not with automatically generated Let's Encrypt certificates).

https://youtu.be/Hwqm1D2EfFU

That video show how to setup a cert-manager inside the Kubernetes cluster
that will automatically get TLS certificates for web services running in the cluster.

The setup described below has the following properties:
* HAProxy will listen on 443 and is configured in tcp mode (not http mode)
* HAProxy will not have a certificate (no certificate validation will be done on HAProxy)
* web service runnning in the cluster will listen on port 80 (without TLS)
* between HAProxy and the webservice there will be an NGINX Inc Ingress controller
* the NGINX Inc Ingress controller will get a staging TLS certificate from Let's Encrypt

Staging certificates (as opposed to prod certificates) won't acutally be signed by Let's Encrypt.
So this video is not so interesting... but let's try it anyway, just to see if the process is working.

First [Install NGINX Inc Ingress controller](#install-nginx-inc-ingress-controller)

Then [Install and configure HAProxy](#install-and-configure-haproxy)

Just add the following lines to haproxy.conf (in addition to http:80 frontend and backend):
```text
frontend http_front
  bind *:443
  mode tcp
  option tcplog
  default_backend http_back

backend http_back
  mode tcp
  balance roundrobin
  server kube node1:443
  server kube node2:443
  server kube node3:443
```
### Install cert-manager 

We'll be using the Jetstack cert-manager

Official documentation: https://cert-manager.io/docs/installation/kubernetes/

cert-manager on Helm Hub: https://hub.helm.sh/charts/jetstack/cert-manager

First install CustomResourceDefinitions:
```bash
# nstall the cert-manager CustomResourceDefinition resources
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.15.0-alpha.2/cert-manager.crds.yaml
# Add the Jetstack Helm repository 
helm repo add jetstack https://charts.jetstack.io
# check its ok
helm repo list
# create the namespace
kubectl create ns cert-manager
# Install the cert-manager helm chart with Helm 3
helm install --namespace cert-manager cert-manager  jetstack/cert-manager
```
You can check the installation by creating test resources provided by cert-manager:
```bash
kubectl create -f 11-test-resources.yaml
kubectl describe certificate -n cert-manager-test | tail -n5
```
```text
Type    Reason        Age    From          Message
----    ------        ----   ----          -------
Normal  GeneratedKey  3m22s  cert-manager  Generated a new private key
Normal  Requested     3m22s  cert-manager  Created new CertificateRequest resource "selfsigned-cert-504566127"
Normal  Issued        3m22s  cert-manager  Certificate issued successfully
```
Cleanup:
```bash
kubectl delete -f 11-test-resources.yaml
```

### cert-manager demo

First deploy the ClusterIssuer resource with the ``11-ClusterIssuer.yaml`` manifest
```yaml
apiVersion: cert-manager.io/v1alpha2
kind: Issuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
    server: https://acme-staging-v02.api.letsencrypt.org/directory # staging API
    email: user@example.com  # you must put your email here
    privateKeySecretRef:
      name: letsencrypt-staging  # must match the secret name of the Ingress
    solvers:
    - http01:
       ingress:
         class: nginx
```
```bash
kubectl create -f 11-ClusterIssuer.yaml
```

Then create a simple nginx deployment and service:
```bash
kubectl create deployment nginx --image nginx
kubectl expose deploy nginx --port 80
```
Finally create the Ingress using the ``11-ingress-resource.yaml`` manifest:
```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: nginx-ingress-resource
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-staging # must match the name of the issuer
spec:
  tls:
    - hosts:
        - nginx.example.com
      secretName: letsencrypt-staging  # the name of the secret
  rules:
    - host: nginx.example.com
      http:
        paths:
          - backend:
              serviceName: nginx  # name of the service created above
              servicePort: 80
```
```bash
kubectl create -f 11-ingress-resource.yaml
```
Then if you describe the ingress, you'll see in the events that the certificate has been generated:
```bash
kubectl describe ingresses nginx-ingress-resource | tail -n4
```
```text
[...]
Events:
  Type    Reason             Age   From          Message
  ----    ------             ----  ----          -------
  Normal  CreateCertificate  14s   cert-manager  Successfully created Certificate "letsencrypt-staging"
```
Then you can list certificates:
```bash
kubectl get certificates
```
```text
NAME                  READY   SECRET                AGE
letsencrypt-staging   False   letsencrypt-staging   4m36s
```
And you can describe your certificate to know the DNS name etc...
```bash
kubectl describe certificate letsencrypt-staging
```
Finally put this line in your /etc/hosts:
```text
127.0.0.1 nginx.example.com
```

And test:
```bash
curl  https://nginx.example.com
```
It doesn't work for me:
```text
curl: (35) error:14094410:SSL routines:ssl3_read_bytes:sslv3 alert handshake failure
```

To be continued in paragraph below...

## Deploy and use Nginx ingress controller

https://www.youtube.com/watch?v=2VUQ4WjLxDg

This time we're going to install the Kubernetes-supported nginx ingress controller
(last time we installed the ingress controller supported by NGINX Inc).

Prerequisites: 
* this ingress controller requires the MetalLB load balancer: see [Install MetalLB](#install-metallb)
* you must comment any line of ``/etc/hosts`` resolving *nginx.example.com to HAProxy IP
* last https example requires the install of cert-manager: see [Install cert-manager](#install-cert-manager)

The video content is outdated now (using Helm 2), so we will follow the official guide:

https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal 

We're going to do this with Helm 3.

### Install Nginx ingress controller

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
kubectl create ns ingress-nginx
helm install --namespace ingress-nginx ingress-nginx ingress-nginx/ingress-nginx
```
After the install it shows:
```text
NAME: ingress-nginx
LAST DEPLOYED: Wed Apr 29 20:13:17 2020
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
The ingress-nginx controller has been installed.
It may take a few minutes for the LoadBalancer IP to be available.
You can watch the status by running 'kubectl --namespace default get services -o wide -w ingress-nginx-controller'

An example Ingress that makes use of the controller:

  apiVersion: networking.k8s.io/v1beta1
  kind: Ingress
  metadata:
    annotations:
      kubernetes.io/ingress.class: nginx
    name: example
    namespace: foo
  spec:
    rules:
      - host: www.example.com
        http:
          paths:
            - backend:
                serviceName: exampleService
                servicePort: 80
              path: /
    # This section is only required if TLS is to be enabled for the Ingress
    tls:
        - hosts:
            - www.example.com
          secretName: example-tls

If TLS is enabled for the Ingress, a Secret containing the certificate and key must also be provided:

  apiVersion: v1
  kind: Secret
  metadata:
    name: example-tls
    namespace: foo
  data:
    tls.crt: <base64 encoded cert>
    tls.key: <base64 encoded key>
  type: kubernetes.io/tls
```
Then wait for the External IP to be available:
```bash
kubectl --namespace ingress-nginx get services -o wide -w ingress-nginx-controller
```
```text
NAME                       TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)                      AGE   SELECTOR
ingress-nginx-controller   LoadBalancer   10.233.31.191   192.168.1.240   80:30080/TCP,443:31403/TCP   82s   app.kubernetes.io/component=controller,app.kubernetes.io/instance=ingress-nginx,app.kubernetes.io/name=ingress-nginx
```

### Demo

Let's create our blue and green deployments and services once again:
```bash
kubectl create -f nginx-deploy-blue.yaml
kubectl create -f nginx-deploy-green.yaml
kubectl expose deployment nginx-deploy-blue --port 80
kubectl expose deployment nginx-deploy-green --port 80
```
But now we need to add a special annotation to our ``12-ingress-resource-4.yaml`` Ingress manifest:
```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: ingress-resource-4
  annotations:
    kubernetes.io/ingress.class: nginx # this annotation is required by ingress-nginx
spec:
  rules:
  - host: blue.nginx.example.com
    http:
      paths:
      - backend:
          serviceName: nginx-deploy-blue
          servicePort: 80
  - host: green.nginx.example.com
    http:
      paths:
      - backend:
          serviceName: nginx-deploy-green
          servicePort: 80
```
```bash
kubectl create -f 12-ingress-resource-4.yaml
```
Now we need to know the external IP of our LoadBalancer:
```bash
kubectl -n ingress-nginx get services | grep -v ClusterIP
```
```text
NAME                                 TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)                      AGE
ingress-nginx-controller             LoadBalancer   10.233.31.191   192.168.1.240   80:30080/TCP,443:31403/TCP   147m
```
Add this IP to your ``/etc/hosts``:
```text
192.168.1.240 blue.nginx.example.com
192.168.1.240 green.nginx.example.com
192.168.1.240 nginx.example.com
```
And it works:
```bash
curl blue.nginx.example.com
curl green.nginx.example.com
```
```text
<h1>I am <font color=blue>BLUE</font></h1>
<h1>I am <font color=green>GREEN</font></h1>
```
### Automatically generated self-signed certificate

Now let's try https and self-signed certificate creation.

Let's deploy the ``12-ingress-resource.yaml`` ingress manifest:
```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: nginx-ingress-resource
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-staging # must match the name of the issuer
    kubernetes.io/ingress.class: nginx  # this annotation is required by ingress-nginx
spec:
  tls:
    - hosts:
        - nginx.example.com
      secretName: letsencrypt-staging  # the name of the secret
  rules:
    - host: nginx.example.com
      http:
        paths:
          - backend:
              serviceName: nginx  # name of the service created above
              servicePort: 80
```
And it works (-k because certificate is self-signed):
```bash
curl -k https://nginx.example.com | grep title
```
```text
<title>Welcome to nginx!</title>
```

### Automatically Let's Encrypt generated certificate (not working)

I've tried to get cert-manager obtain a real certificate from Let's Encrypt, but I failed:
```yaml
apiVersion: cert-manager.io/v1alpha2
kind: ClusterIssuer # AFAIK ClusterIssuer can create certificates for all namespaces, and Issuer only for the current namespace
metadata:
  name: letsencrypt-prod
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory # prod API
    email: my.email@provider.com
    privateKeySecretRef:
      name: letsencrypt-prod  # must match the secret name of the Ingress
    solvers:
      - http01:
          ingress:
            class: nginx
```
```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: nginx-ingress-resource-prod
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-prod # must match the name of the issuer
    kubernetes.io/ingress.class: nginx
spec:
  tls:
    - hosts:
        - my.real.domain
      secretName: letsencrypt-prod  # the name of the secret
  rules:
    - host: my.real.domain
      http:
        paths:
          - backend:
              serviceName: realdomain-nginx  # name of the service created above
              servicePort: 80
```
But when describing the secret:
```bash
kubectl describe certificate letsencrypt-prod
```
We can see the request is stuck in the InProgress state:
```text
Status:
  Conditions:
    Last Transition Time:  2020-04-30T09:25:08Z
    Message:               Waiting for CertificateRequest "letsencrypt-prod-1494693867" to complete
    Reason:                InProgress
    Status:                False
    Type:                  Ready
```
Maybe it has something to do with the ``http01`` challenge selected here. 
Maybe it would work with the ``dns01`` challenge involving setting a TXT record in the DNS. 
But I don't know how to go on this way because there is a notion "supported DNS providers" in cert-manager:

https://cert-manager.io/docs/configuration/acme/dns01/#supported-dns01-providers

As I'm playing with a Kubernetes cluster at home, with a NoIP dynamic domain name.
There is a ``RFC-2136`` item supposed to work with RFC2136 compliant DNS server but I don't know
how to proceed (and I'm tired by that for the moment).

### Manually install an existing Let's encrypt certificate

So I've chosen another approach: using certbot to get a Let's Encrypt certificate and install it manually
in my cluster.

So here is the procedure:
```bash
# on an ubuntu machine
sudo apt install apache2
sudo apt install python-certbot-apache
sudo apt install certbot
sudo certbot --apache
```
Or, if you don't want to use apache, you can simply ask certbot to generate the certificate 
(requires a DNS challenge, thus the ability to add a TXT record to your DNS entry):
```bash
sudo certbot certonly --preferred-challenges=dns --manual -d "my.real.domain" --agree-tos --no-bootstrap
```
At the end of the procedure certbot is showing:
```text
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/my.real.domain/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/my.real.domain/privkey.pem
```
Grab those two files and create a secret in the cluster:
```bash
kubectl create secret tls realdomain-cert --cert fullchain.pem --key privkey.pem
```
Then setup your ingress like this:
```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: nginx-ingress-resource-prod
  annotations:
    # no longer required because not managed by cert-manager (too bad...)
    # cert-manager.io/cluster-issuer: letsencrypt-prod 
    kubernetes.io/ingress.class: nginx
spec:
  tls:
    - hosts:
        - my.real.domain
      secretName: realdomain-cert  # the name of the manually imported secret
  rules:
    - host: my.real.domain
      http:
        paths:
          - backend:
              serviceName: realdomain-nginx  # name of the service created above
              servicePort: 80
```
And here it comes:
```bash
curl https://my.real.domain | grep title
```
```text
<title>Welcome to nginx!</title>
```
## Ingresses

Official documentation: https://kubernetes.io/fr/docs/concepts/services-networking/ingress/

Note that ingress configuration seems quite flexible:
```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: simple-fanout-example
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: foo.bar.com            # for the same host
    http:
      paths:
      - path: /foo               # you can redirect the /foo path... 
        backend:
          serviceName: service1  # ... to service1
          servicePort: 4200
      - path: /bar               # and redirect the /bar path... 
        backend:
          serviceName: service2  # ... to service 2
          servicePort: 8080
```

## Pod Disruption Budget

https://www.youtube.com/watch?v=09Wkw9uhPak&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=66

(not tested, only transcript)

A cluster administrator might need to drain all the pods from a node
in order to perform some maintenance operations on that node.

Pod Disruption Budget (pdb) is a way for cluster users to express how many pods of a replicaset
can be stopped or, put differenly, how many of them must remain active of a maintenance
operation occurs. 

Let's create a deployment with 4 replicas:
```bash
kubectl create deploy nginx --image=nginx --replicas=4
```

Let's imagine our cluster has 2 worker nodes (kworker1 and kworker2) and that those pods 
are evenly distributed on those 2 nodes.

Now let's create a pdb that will target our pods (thanks to the selector) and that will 
require a minimum of 2 pods:
```bash
# with percentage
kubectl create pdb pdbdemo --min-available 50% --selector "run=ginx"
# with absolute value
kubectl create pdb pdbdemo2 --min-available 2 --selector "run=ginx"
```
You can also create them using the ``11-pdb.yaml`` manifest:
```yaml
apiVersion: policy/v1beta1
kind: PodDisruptionBudget
metadata:
  name: pdbdemo
spec:
  minAvailable: 2
  selector:
    matchLabels:
      run: nginx
```
```bash
kubectl create -f 11-pdb.yaml
```
Now let's drain all pods from kworker1:
```bash
kubectl drain kworker1 --ignore-daemonsets
```
As a result 2 pods have been removed from kworker1 and 2 pods have been created on kworker2 (having a total of 4).

Now if you try to drain all pods from kworker2:
```bash
kubectl drain kworker1 --ignore-daemonsets
```
The operation will not complete (kubectl command will not finish) and 
you will get a bunch of error messages  since it violates the pdb.
Two pods will be removed though and two pods will remain.
On top of that the replicaset will try to recreate pods but they will stay in 
the Pending state because the node is in the ShedulingDisabled state (kubectl get nodes).

To get back to a normal state:
```bash
kubectl uncordon kworker1
kubectl uncordon kworker2
```
You can't edit pdbs. You must delete and recreate them.


## MongoDB replica set installation

In this video you'll see a demo of a "manual" MongoDB replica set setup:

https://www.youtube.com/watch?v=W-lJX3_uE5I

"manual" because you have to run mongodb commands to configure the replica set. 
That is still quite interesting because there is a demo of scaling the replica set.

After a little search on Helm Hub (https://hub.helm.sh) we realize there is no official MongoDB Helm chart. 
The ``bitnami/mongo`` chart looks promising with a 4.2.6 version of MongoDB.

Documentation of the chart: https://hub.helm.sh/charts/bitnami/mongodb

The documentation is describing all parameters of the chart.

### Warning 

When restarting the cluster (or simply deleting all mongodb pods) the MongoDB replica set
can becoming invalid (at least on some Kubernetes clusters):

https://github.com/bitnami/bitnami-docker-mongodb/issues/211

If you have that problem it is related to the ``readinessProbe`` and you should
disable using ``readinessProbe.enabled=false`` Helm chart parameter.

It is unsure it is a rock-solid solution though.

### Create Persistent Volumes

For a first try, we'll setup MongoDB over NFS.
MongoDB documentation says it's OK with specific NFS mount options (bg, nolock, and noatime): 
https://docs.mongodb.com/manual/administration/production-notes/

To setup an NFS server with NFS shares see: [Create NFS shares](#create-nfs-shares) 

 
We'll create 3 NFS PVs with the ``mongodb-nfs-pvs.yaml`` manifest (8Gi is the default value of the MongoDB chart):
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-nfs-pv0
  labels:
    type: local
spec:
  storageClassName: mongovol
  capacity:
    storage: 8Gi
  accessModes:
    - ReadWriteOnce
  mountOptions:
    - bg
    - nolock
    - noatime
  nfs:
    server: node1
    path: "/srv/nfs/kubedata/pv0"
---
etc...
```
```bash
kubectl create -f mongodb-nfs-pvs.yaml
```

### Install the chart

Let's install a MongoDB replicaset (that is not a Kubernetes replicaset) as a statefulset with 
password enabled, an ingress, metrics enabled (with mongodb exporter), 1 arbiter, 1 master and 2 replicas:
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm  install mymongo --set usePassword=true,mongodbRootPassword=secretpassword,mongodbUsername=my-user,mongodbPassword=my-password,mongodbDatabase=my-database,replicaSet.enabled=true,useStatefulSet=true,ingress.enabled=true,metrics.enabled=true,replicaSet.replicas.secondary=2,persistence.storageClass=mongovol bitnami/mongodb
```
Chart output will contain interesting information:
```text
MongoDB can be accessed via port 27017 on the following DNS name from within your cluster:
    mymongo-mongodb.default

To get the root password run:

    export MONGODB_ROOT_PASSWORD=$(kubectl get secret --namespace default mymongo-mongodb -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)

To get the password for "my-user" run:

    export MONGODB_PASSWORD=$(kubectl get secret --namespace default mymongo-mongodb -o jsonpath="{.data.mongodb-password}" | base64 --decode)

To connect to your database run the following command:

    kubectl run --namespace default mymongo-mongodb-client --rm --tty -i --restart='Never' --image docker.io/bitnami/mongodb:4.2.6-debian-10-r13 --command -- mongo admin --host mymongo-mongodb --authenticationDatabase admin -u root -p $MONGODB_ROOT_PASSWORD

To connect to your database from outside the cluster execute the following commands:

    kubectl port-forward --namespace default svc/mymongo-mongodb 27017:27017 &
    mongo --host 127.0.0.1 --authenticationDatabase admin -p $MONGODB_ROOT_PASSWORD
```

We can also connect to pods individually using:
```bash
kubectl exec -it mymongo-mongodb-secondary-0 -- /bin/bash
mongo -uroot -psecretpassword
# if you want to run shell commands on secondary nodes (like here) 
# you have to type (https://docs.mongodb.com/manual/reference/method/rs.slaveOk/):
rs.slaveOk()
```

Once installation is over, the scheduling of pods on cluster nodes (we have node1, node2 and node3) is surprising.
We have the master, the arbiter and one replica on node1, one replica on node2, and nothing on node3:
```bash
kubectl get pods -o wide | grep -E "READY|mongo"
```
```text
NAME                                  READY   STATUS    RESTARTS   AGE     IP              NODE    NOMINATED NODE   READINESS GATES
mymongo-mongodb-arbiter-0             1/1     Running   3          14h     10.233.90.187   node1   <none>           <none>
mymongo-mongodb-primary-0             2/2     Running   2          14h     10.233.90.180   node1   <none>           <none>
mymongo-mongodb-secondary-0           2/2     Running   2          14h     10.233.96.67    node2   <none>           <none>
mymongo-mongodb-secondary-1           2/2     Running   2          14h     10.233.90.193   node1   <none>           <none>
```
If we check NFS mount options on node2 it is not sure the ``bg`` option has been taken into account:
```bash
ansible node2 -m shell -a "mount -l | grep nfs"
```
```text
node1:/srv/nfs/kubedata/pv0 on /var/lib/kubelet/pods/ad0afbd7-c6c8-46dc-9d48-b35d35a815d8/volumes/kubernetes.io~nfs/pv-nfs-pv0 type nfs4 (rw,noatime,vers=4.2,rsize=1048576,wsize=1048576,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=192.168.1.14,local_lock=none,addr=192.168.1.12)
```
### Ingress

(todo)

There is a *Configure Ingress* paragraph in the chart documentation: https://hub.helm.sh/charts/bitnami/mongodb

It is suggesting that it requires a specific configuration of the nginx ingress controller.

### Expose using a LoadBalancer

Requires MetalLB: see [Install MetalLB](#install-metallb)

Change the ``mymongo-mongodb`` service from ClusterIP to LoadBalancer:
```bash
kubectl patch svc mymongo-mongodb -p '{"spec": {"type": "LoadBalancer"}}'
```
Please note that this will create a loab balancer on arbiter, primary and secondary pods.
It will not give you access to them individually. 

This video is describing exposing each pod using MetalLB load balancer:

https://youtu.be/DE83o7SR0xY

It consists in manually exposing primary and secondary pods then use the external IP generated by MetalLB:
https://youtu.be/DE83o7SR0xY?t=318

So it is not so nice since there is nothing automatic in case of scale up and down.

### Java driver

If the service is exposed like this:
```bash
kubectl port-forward --namespace default svc/mymongo-mongodb 27017:27017
```
Then the Java driver can't connect to the replicaset:
```ini
uri=mongodb://root:secretpassword@localhost:27017/?maxPoolSize=50&replicaSet=rs0
```
Because it can't resolve the hostnames that only make sense from within the cluster:
```text
java.net.UnknownHostException: mymongo-mongodb-secondary-1.mymongo-mongodb-headless.default
```
So you have to remove the ``replicaSet`` option:
```ini
uri=mongodb://root:secretpassword@localhost:27017/?maxPoolSize=50
```
This will be working because the mymongo-mongodb service will only target the primary node.
But I don't know the consequences of not using ``replicaSet`` in the URI.

### Uninstall

Uninstall with Helm:
```bash
helm uninstall mymongo
```
Delete PVCs and PVs:
```bash
kubectl delete pvc datadir-mymongo-mongodb-primary-0
kubectl delete pvc datadir-mymongo-mongodb-secondary-0
kubectl delete pvc datadir-mymongo-mongodb-secondary-1
kubectl delete -f mongodb-nfs-pvs.yaml
```
Delete the PV content:
```bash
ansible -b node2,node3 -a "rm -rf /var/kubernetes/mongovol0/data"
ansible -b node2,node3 -a "rm -rf /var/kubernetes/mongovol1/data"
```

### Conclusion

At this point the notion of Kubernetes **Operator** is starting to make sense (maybe). 
An operator would probably be able to assign pods to distinct nodes.

There is an official MongoDB Kubernetes Operator, but it seems to be part of the Enterprise version:

https://docs.mongodb.com/kubernetes-operator/master/tutorial/install-k8s-operator/

There are Kubernetes features allowing to mitigate this kind of behavior:
* node affinity/anti affinity
* pod affinity/anti affinity (although that one is not recommended for large clusters)
* pod limits

### An alternative setup (going into details)

In my demo cluster node1 has an HDD, node2 and node3 have an SSD.

I want to install MongoDB in a ``mongodb`` namespace, only on machines having an SSD, 
using HostPath volumes (I don't want to use NFS).

First we're going to label nodes and create a mongodb namespace:
```bash
kubectl label node node1 disk=hdd
kubectl label node node2 disk=ssd
kubectl label node node3 disk=ssd
kubectl create ns mongodb
```
Then instead of providing chart parameters on the command-line, we'll use a ``mymongo-values.yaml`` values file:
```yaml
# values previously on set on command-line
usePassword: true
mongodbRootPassword: secret # this time the password is different
# and we don't want to create this additional my-user user having access the my-database database
#mongodbUsername: my-user
#mongodbPassword: my-password
#mongodbDatabase: my-database
useStatefulSet: true
ingress:
  enabled: true
metrics:
  enabled: true
replicaSet:
  enabled: true
  replicas:
    secondary: 1 # this time we only want one replica
persistence:
  storageClass: mongovol
affinity:
  # we want to assign primary and secondary to nodes...
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution: # ... that MUST (**required**DuringSchedulingIgnoredDuringExecution)
      nodeSelectorTerms:
        - matchExpressions:                         # ... satisfy these conditions:
            - key: disk                             # a label called "disk"
              operator: In
              values: [ ssd ]                       # with an "sdd" value
  podAntiAffinity: # with a limitation on "surrounding pods":
    requiredDuringSchedulingIgnoredDuringExecution: # "surrounding pods" MUST NOT:
      - labelSelector:                              # have a label
          matchExpressions:
            - key: component                        # called "component"
              operator: In
              values: [ primary, secondary ]        # with an "primary" or "secondary" value
        topologyKey: "kubernetes.io/hostname"       # with "surrounding pods" defined as pods running on the same hostname
affinityArbiter:
  # we want to assign arbiter to the machine with an HDD
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
            - key: disk
              operator: In
              values: [ hdd ]
```
Official documentation of Kubernetes affinity: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/

Note: using the ``template`` command, we tell Helm to generate the Kubernetes manifest without applying it
so we can have a look at it:
``` bash
helm template --namespace mongodb -f mymongo-values.yaml  bitnami/mongodb > mongodb2.yaml
```
Since we don't have easy dynamic volume provisioning on bare metal (besides NFS) 
we want to create ``HostPath`` volumes. This is far from ideal and definitely not
the good way to go in the cloud, but it will be OK for a demo cluster on bare metal.

First create volume directories on ssd nodes (mode=0777 might not be required):
```bash
ansible -b node2,node3 -m file -a "path=/var/kubernetes/mongovol0 mode=0777 state=directory"
ansible -b node2,node3 -m file -a "path=/var/kubernetes/mongovol1 mode=0777 state=directory"
```

Then we create NodePath volumes using the ``mongodb-hostpath-pvs.yaml`` manifest:
```yaml
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-hostpath-mongovol0
  labels:
    type: local
spec:
  storageClassName: mongovol
  capacity:
    storage: 8Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/var/kubernetes/mongovol0"
---
another one not shown here for mongovol1
```
```bash
kubectl create -f mongodb-hostpath-pvs.yaml
```

Finally we run the chart:
```bash
helm install  --namespace mongodb -f mymongo-values.yaml mymongo bitnami/mongodb
```
And now we have the expected distribution of pods:
```bash
kubectl get pods -o wide | grep -E "READY|mongo"
```
```text
NAME                              READY   STATUS    RESTARTS   AGE     IP              NODE    NOMINATED NODE   READINESS GATES
pod/mymongo-mongodb-arbiter-0     1/1     Running   0          5m23s   10.233.90.204   node1   <none>           <none>
pod/mymongo-mongodb-primary-0     2/2     Running   0          5m24s   10.233.92.165   node3   <none>           <none>
pod/mymongo-mongodb-secondary-0   2/2     Running   0          5m24s   10.233.96.71    node2   <none>           <none>
```

## Elasticsearch

There are several ways to install Elasticsearch on Kubernetes:
* Elastic Cloud on: a Kubernetes operator for Elasticsearch Kibana Filebeat etc...
* Official Elasticsearch Helm chart
* Bitnami Elasticsearch Helm chart (Bitnami is also providing the MongoDB chart)

The following is a very interesting article explaining Elasticsearch architecture and deployment options.
It is really helpful to first read up the the *Elasticsearch Deployment: Cluster Topology*  paragraph (included): 

https://sematext.com/blog/kubernetes-elasticsearch/

A very interesting exerpt: 

*By default, when you deploy an Elasticsearch cluster, all Elasticsearch Pods have all roles. The roles can be master, data, and client. The client is often also called coordinator. Master Pods are responsible for managing the cluster, managing indices, and electing a new master if needed. Data Pods are dedicated to store data, while client Pods have no role whatsoever except for funneling incoming traffic to the rest of the Pods.*

Official documentation about Elasticsearch roles: https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-node.html

Before installing Elasticsearch, you probably want to configure your machines according to
Elasticsearch recommendations:
```bash
ansible k8s -b -m sysctl -a "name=vm.max_map_count value='262144'"
``` 
This can be done by Elastic Cloud (quoting) *this requires the ability to run privileged containers, which is likely not the case on many secure clusters*: 
https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-virtual-memory.html

### Elastic Cloud on Kubernetes

Elastic Cloud on Kubernetes seems to be part of the Enterprise offer of Elasticsearch,
so it is probably not free:

https://www.elastic.co/fr/subscriptions

However there are evidences showing that it will always be free:

https://www.elastic.co/fr/blog/introducing-elastic-cloud-on-kubernetes-the-elasticsearch-operator-and-beyond

This videos is showing how to use it: https://youtu.be/qjnT0pU0IRo?t=242

Official documentation: https://www.elastic.co/guide/en/cloud-on-k8s/current/index.html

#### Install the Elastic Cloud Operator

First deploy the Elastic Cloud Operator:
```bash
kubectl apply -f https://download.elastic.co/downloads/eck/1.1.0/all-in-one.yaml
```
It will create the operator in the ``elastic-system`` namespace:
```bash
kubectl -n elastic-system get all -o wide
```

#### Create Persistent Volumes

Since we don't have easy dynamic volume provisioning on bare metal (besides NFS) 
we want to create ``HostPath`` volumes. This is far from ideal and definitely not
the good way to go in the cloud, but it will be OK for a demo cluster on bare metal.

First create volume directories on our nodes (mode=0777 might not be required):
```bash
ansible k8s -b -m file -a "path=/var/kubernetes/elasticvol0 mode=0777 state=directory"
ansible k8s -b -m file -a "path=/var/kubernetes/elasticvol1 mode=0777 state=directory"
ansible k8s -b -m file -a "path=/var/kubernetes/elasticvol2 mode=0777 state=directory"
```
Then create PVs using the ``elasticsearch-hostpath-pvs.yaml`` manifest:
```yaml
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-hostpath-elasticvol0
  labels:
    type: local
spec:
  storageClassName: elasticvol
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/var/kubernetes/elasticvol0"
---
2 others not shown here for elasticvol1 and elasticvol2
```
```bash
kubectl create -f elasticsearch-hostpath-pvs.yaml
```

#### Let the operator install Elasticsearch

Now we need to deploy an Elasticsearch using a manifest. 
The default manifest will deploy 3 services and a single-pod statefulset having all roles (master, data, ingest)
in the default namespace:
```yaml
apiVersion: elasticsearch.k8s.elastic.co/v1
kind: Elasticsearch
metadata:
  name: quickstart
spec:
  version: 7.6.2
  nodeSets:
    - name: default
      count: 1
      config:
        node.master: true
        node.data: true
        node.ingest: true
        node.store.allow_mmap: false
```

It is probably configured to use in-memory indices since it is disabling the use of memory map files (``store.allow_mmap: false``).

Since we don't have easy volume dynamic provisioning on bare metal, we'll need to go a step further regarding configuration.

Official documentation of all parameters: https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-elasticsearch-specification.html

With this ``elasticcloud/elasticsearch-quickstart.yaml`` manifest:
```yaml
apiVersion: elasticsearch.k8s.elastic.co/v1
kind: Elasticsearch
metadata:
  name: quickstart
spec:
  version: 7.6.2
  nodeSets:
    - name: default
      count: 1     # set to 3 if you want 3 elasticsearch nodes
      config:
        node.master: true
        node.data: true
        node.ingest: false  # document processing
        node.store.allow_mmap: true # allow use of mmap
      volumeClaimTemplates:  # use our elasticvol storage class
        - metadata:
            name: elasticsearch-data
          spec:
            accessModes:
              - ReadWriteOnce
            resources:
              requests:
                storage: 5Gi
            storageClassName: elasticvol
      podTemplate:
        spec:
          nodeSelector:  # use a node with an SSD
            disk: ssd
```
```bash
kubectl apply -f elasticcloud/elasticsearch-quickstart.yaml
```
A few minutes later (depending on your bandwidth) you get 
a stateful set, its pod, and 3 services in your default namespace:
```bash
kubectl get all | grep -E "NAME|quickstart"
```
```text
NAME                                      READY   STATUS    RESTARTS   AGE
pod/quickstart-es-default-0               1/1     Running   0          13m

NAME                              TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/quickstart-es-default     ClusterIP   None            <none>        <none>         13m
service/quickstart-es-http        ClusterIP   10.233.20.136   <none>        9200/TCP       13m
service/quickstart-es-transport   ClusterIP   None            <none>        9300/TCP       13m

NAME                                     READY   AGE
statefulset.apps/quickstart-es-default   1/1     13m
```
Check the status of the Elasticsearch cluster:
```bash
kubectl get elasticsearch
```
```text
NAME         HEALTH   NODES   VERSION   PHASE   AGE
quickstart   green    1       7.6.2     Ready   32m
```

Now forward traffic to your laptop:
```bash
kubectl port-forward service/quickstart-es-http 9200
```
And here it comes:
```bash
# get the password
PASSWORD=$(kubectl get secret quickstart-es-elastic-user -o go-template='{{.data.elastic | base64decode}}')
# test
curl -u "elastic:$PASSWORD" -k "https://localhost:9200" | grep tagline
```
```text
"tagline" : "You Know, for Search"
```

#### Expose Elasticsearch using a LoadBalancer

Requires MetalLB: see [Install MetalLB](#install-metallb)

Change the ``quickstart-es-http`` service from ClusterIP to LoadBalancer:
```bash
kubectl patch svc quickstart-es-http -p '{"spec": {"type": "LoadBalancer"}}'
```
Get it external IP:
```bash
kubectl get svc quickstart-es-http
```
```text
quickstart-es-http   LoadBalancer   10.233.40.216   192.168.1.241   9200:32642/TCP   52m
```
Test:
```bash
curl -u "elastic:$PASSWORD" -k "https://192.168.1.241:9200" | grep tagline
```
```text
  "tagline" : "You Know, for Search"
```

#### Install Kibana

Use the operator once again to install Kibana using the ``kibana-quickstart.yaml`` manifest:
```yaml
apiVersion: kibana.k8s.elastic.co/v1
kind: Kibana
metadata:
  name: quickstart
spec:
  version: 7.6.2
  count: 1
  elasticsearchRef:
    name: quickstart
```
```bash
kubectl create -f elasticcloud/kibana-quickstart.yaml
```

Check the status of Kibana:
```bash
kubectl get kibana
```
```text
NAME         HEALTH   NODES   VERSION   AGE
quickstart   green    1       7.6.2     8m24s
```
Now forward traffic to your laptop:

```bash
kubectl port-forward service/quickstart-kb-http 5601
```
And open in your browser: https://localhost:5601/

Provide the Elasticsearch credentials (see above).


#### Install Filebeat

Download the Filebeat Kubernetes manifest:
```bash
curl -L -O https://raw.githubusercontent.com/elastic/beats/master/deploy/kubernetes/filebeat-kubernetes.yaml
```
Then edit it to change some values:
* Replace all ``kube-system`` with ``default``: Filebeat must be installed in the same namespace as Elasticsearch (``default`` in that example)
* Replace all ``docker.elastic.co/beats/filebeat:8.0.0`` with ``docker.elastic.co/beats/filebeat:7.6.2`` (the 8.0.0 does not exist yet)
* Add ``ssl.certificate_authorities`` section under ``output.elasticsearch``
```yaml
    output.elasticsearch:
      hosts: ['${ELASTICSEARCH_HOST:elasticsearch}:${ELASTICSEARCH_PORT:9200}']
      username: ${ELASTICSEARCH_USERNAME}
      password: ${ELASTICSEARCH_PASSWORD}
      ssl.certificate_authorities:
        - /etc/certificate/ca.crt
```
* Add a volume to the DaemonSet in order to mount the certificates (the secret is named after your Elasticsearch installation: ``quickstart`` in that example)
```yaml
      volumes:
      - name: certs
        secret:
          secretName: quickstart-es-http-certs-public
```
* Mount the volume in the DaemonSet:
```yaml
        volumeMounts:
        - name: certs
          mountPath: /etc/certificate/ca.crt
          readOnly: true
          subPath: ca.crt
```
* Change the value of the ``ELASTICSEARCH_HOST`` variable to the name of the service (named after your Elasticsearch installation: ``quickstart`` in that example):
```yaml
        env:
        - name: ELASTICSEARCH_HOST
          value: https://quickstart-es-http
``` 
* Change the value of the ``ELASTICSEARCH_PASSWORD`` variable to the name of the service:
```yaml
        env:
        - name: ELASTICSEARCH_PASSWORD
          value: yourpasswordhere
```
And finally deploy the manifest:
```bash
kubectl create -f filebeat-kubernetes.yaml
```
Once everything is started you should see in logs of each filebeat pod that it has established 
a connection with Elasticsearch:
```bash
kubectl logs filebeat-7x2hd | grep established
```
```text
Connection to backoff(elasticsearch(https://quickstart-es-http:9200)) established
```
Then open the Kibana dashboard (see above) and create an index pattern:

https://localhost:5601/

Details about that step here (plus an overview of how to create visualizations and dashboards):

https://youtu.be/fNMmnN8gLCw?t=793

#### Uninstall

Uninstall Elasticsearch:
```bash
kubectl delete elasticsearch quickstart
```
Delete PVs:
```bash
kubectl delete -f elasticsearch-hostpath-pvs.yaml
```
Uninstall Kibana:
```bash
kubectl delete kibana quickstart
```
Uninstall Filebeat:
```bash
kubectl delete -f filebeat-kubernetes.yaml
```
There should be nothing left:
```bash
kubectl get elastic
```

## Running a private docker registry

We will describe how to run a private docker registry and to use it in the Kubernetes cluster.

### Install docker and docker-compose

Create a ``installdocker.yaml`` playbook:
```yaml
---
- hosts: yourserver
  become: yes
  vars:
    docker_install_compose: true
    docker_users: # to assign the docker group
    - john
  roles:
    - geerlingguy.docker
```
Run it:
```bash
sudo ansible-galaxy install geerlingguy.docker
ansible-playbook installdocker.yml
```

### Setup the server

How to configure docker on each node of the Kubernetes cluster to allow insecure (http) docker registries:

https://youtu.be/r15S2tBevoE?t=618

The rest of the video is describing how to run a secure registry (instructions below).

Here we want to install a docker registry running on the ``docker.my.own.domain`` host.

Create directories for data, ssl certificates, passwords:
```bash
sudo mkdir -p /var/docker-registry/{data,certs,auth}
```

Copy certificates and private key generated by certbot for the ``*.my.own.domain`` domain:
```bash
sudo cp fullchain.pem /var/docker-registry/certs/
sudo cp privkey.pem /var/docker-registry/certs/
```
Generate a user and a password:
```bash
htpasswd -Bbn user password | sudo tee -a /var/docker-registry/auth/htpasswd > /dev/null
```
Create a docker-compose file:
```yaml
version: '3.0'
services:
  registry:
    container_name: docker-registry
    restart: always  # comment-out if you don't want to restart during reboot
    image: registry:latest
    environment:
      REGISTRY_HTTP_TLS_CERTIFICATE: /certs/fullchain.pem 
      REGISTRY_HTTP_TLS_KEY: /certs/privkey.pem 
      REGISTRY_AUTH: htpasswd
      REGISTRY_AUTH_HTPASSWD_PATH: /auth/htpasswd
      REGISTRY_AUTH_HTPASSWD_REALM: Registry Realm
    ports:
      - 443:5000
    volumes:
      - /var/docker-registry/data:/var/lib/registry
      - /var/docker-registry/certs:/certs
      - /var/docker-registry/auth:/auth
```
Start the server:
```bash
docker-compose up -d
```

### Test the registry
 
Create a ``Dockerfile`` file:
```Dockerfile
FROM alpine:latest
CMD tail -f /dev/null
```
Build the image:
```bash
docker build -t docker.my.own.domain/my-alpine:v1 .
```
Note that, from docker point of view, the string before the ``/`` is: 
* either a hostname if containing ``.`` or ``:``
* or a docker hub username or organisation

Login:
```bash
docker login docker.my.own.domain
```
Push the image:
```bash
docker push docker.my.own.domain/my-alpine:v1
```

### Declare the server in Kubernetes

If you need to add the docker registry hostname in the ``/etc/hosts`` of your cluster nodes:
```bash
ansible -b k8s -m lineinfile -a 'dest=/etc/hosts regexp=docker.my.own.domain line="192.168.1.20 docker.my.own.domain"'
```
Declare the docker registry credentials in Kubernetes:
```bash
kubectl create secret docker-registry myregistrycredentials --docker-server=docker.my.own.domain --docker-username=username --docker-password=thepassword
```
Add the **image pull secret** to the service account:
```bash
kubectl patch serviceaccount default -p '{"imagePullSecrets": [{"name": "myregistrycredentials"}]}'
```
https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/#add-imagepullsecrets-to-a-service-account

### Test Kubernetes communication with registry

Watch cluster events:
```bash
kubectl get events -w
```
Deploy a pod using an image of the private registry:
```bash
kubectl run myalpine --image=docker.my.own.domain/my-alpine:v1
```
You should see those events:
```text
1s          Normal    Scheduled        pod/myalpine                 Successfully assigned default/myalpine to node1
0s          Normal    Pulling          pod/myalpine                 Pulling image "docker.my.own.domain/my-alpine:v1"
0s          Normal    Pulled           pod/myalpine                 Successfully pulled image "docker.my.own.domain/my-alpine:v1"
0s          Normal    Created          pod/myalpine                 Created container myalpine
0s          Normal    Started          pod/myalpine                 Started container myalpine
```
Cleanup:
```bash
kubectl delete pod myalpine
```

## Running nvidia GPU workloads

It is possible to schedule GPU workloads using this nvidia plugin:

https://github.com/NVIDIA/k8s-device-plugin

It requires the installation of nvidia-docker2 on cluster nodes having an nvidia GPU.

This can be done using the following ``nvidia.yaml`` ansible playbook:
```yaml
- hosts: nvidia
  become: yes
  roles:
    - nvidia.nvidia_driver
    - nvidia.nvidia_docker
```
Then by running:
```bash
sudo ansible-galaxy install nvidia.nvidia_driver
sudo ansible-galaxy install nvidia.nvidia_docker
ansible-playbook nvidia.yaml
```
Then to enable the nvidia runtime as the default runtime in ``/etc/docker/daemon.json``:
```json
{
    "default-runtime": "nvidia",
    "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
```
Once (and only once!) that is done, install the Kubernetes plugin (it will install a daemonset in the ``kube-system`` namespace:
```bash
kubectl create -f https://raw.githubusercontent.com/NVIDIA/k8s-device-plugin/v0.9.0/nvidia-device-plugin.yml
```
Then you can use the ``nvidia.com/gpu: 1`` option in the ``limits`` section. 
For instance let's deploy this ``nvidia-smi.yaml`` job manifest:
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: nvidia-smi
spec:
  template:
    spec:
      containers:
        - name: cuda-container
          image: nvidia/cuda:9.0-cudnn7-devel
          command: ["nvidia-smi"]
          resources:
            limits:
              nvidia.com/gpu: 1
      restartPolicy: Never
```
```bash
kubectl create -f nvidia-smi.yaml
```
Then you can see that the job is scheduled on a node having an nvidia GPU and you will see the ``nvidia-smi`` output in the logs:
```bash
kubectl logs nvidia-smi
```
According to the documentation: 
*if you don't request GPUs when using the device plugin with NVIDIA images all the GPUs on the machine will be exposed inside your container.* 

On my cluster, when I don't specify the limit, the job is still scheduled on the the nvidia node (but who knows... it might be out of luck).

Cleanup:
```bash
kubectl delete job nvidia-smi
```

## Dynamic volume provisioning with Rook and Ceph

Ceph is a distributed filesystem that will allow dynamic volume provisioning on bare metal clusters.

(not tested) below is only a transcript of https://youtu.be/wIRMxl_oEMM
 
### Install Ceph with Rook

```bash
git clone https://github.com/rook/rook.git
cd rook/cluster/examples/kubernetes/ceph
```
Then you want to look at that video to know how to edit the ``cluster.yaml`` file:
https://youtu.be/wIRMxl_oEMM?t=530

You might want to tweak the following parameters.

Number of Ceph monitors:
```yaml
  mon:
    # can be 1 for test clusters
    count: 3
    # are they allowed to run on the same k8s node 
    # can be true for test clusters
    allowMultiplePerNode: false
```
Enable monitoring:
```yaml
  monitoring:
    # requires Prometheus to be pre-installed
    enabled: false
```
Affinity rules:
```yaml
#  placement:
#    all:
```
Whether you want to use all nodes of your cluster:
```yaml
  storage: # cluster level storage configuration and selection
    useAllNodes: true # changed to false in this example
    useAllDevices: true
```
If not, specify the nodes:
```yaml
# Individual nodes and their config can be specified as well, but 'useAllNodes' above must be set to false. Then, only the named
# nodes below will be used as storage resources.  Each node's 'name' field should match their 'kubernetes.io/hostname' label.
#    nodes:
#    - name: "172.17.4.201"
#      devices: # specific devices to use for storage can be specified for each node
#      - name: "sdb"
```

```bash
kubectl create -f common.yaml
kubectl create -f operator.yaml
kubectl create -f cluster.yaml
```
You can watch the operator being deployed:
```bash
kubectl -n rook-ceph get pod
```
It can take a few minutes. When you see ``rook-ceph-osd-prepare`` pods, you're close: 
they will setup Ceph Object Storage Daemon (OSDs).

In the end you want to wait for ``rook-ceph-osd`` pods.

Then we want to create storage classes:
```bash
find . -name storageclass.yaml
```
```text
./flex/storageclass.yaml
./csi/cephfs/storageclass.yaml
./csi/rbd/storageclass.yaml
```
Let's install rdb (by default reclaim policy of volumes is Delete):
```bash
kubectl create -f ./csi/rbd/storageclass.yaml
```
Now create the (Ceph) toolbox:
```bash
kubectl create -f toolbox.yaml
```
It is going to create a ``rook-ceph-tools`` pod, when it is running, run a bash shell inside of it:
```bash
kubectl -n rook-ceph -it rook-ceph-tools-jsdfhlqsjf -- /bin/bash
```
Once inside:
```bash
# everything should look ok
ceph status
ceph osd status
exit
```
You can further add new nodes to the Ceph cluster by adding them to ``cluster.yaml`` 
and them ``kubectl apply -f cluster.yaml`` once again.

### Ceph demo

https://youtu.be/wIRMxl_oEMM?t=1480

Create a ```pcv.yaml``` manifest:
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: firstpvc
  labels:
    app: example
spec:
  storageClassName: rook-ceph-block
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```
```bash
# display existing pvs and pvcs
kubectl get pv
kubectl get pvc
# create the pv
kubectl create -f pvc.yaml
```
The PVC should first have the ``Pending`` status and you should soon have a new volume
bound to your pvc.

Now you can create a pod using this volume, manually write some data into it (exec -it).

Then if you go to ceph tools once again
```bash
kubectl -n rook-ceph -it rook-ceph-tools-jsdfhlqsjf -- /bin/bash
```
Once inside:
```bash
# here you should see some IO
ceph status
# here you should see the volume of data written to the various Ceph nodes
ceph osd status
```

## Dynamic volume provisioning with OpenEBS Mayastor

WARNING: OpenEBS Mayastor is beta software and does not support Velero backups yet (https://velero.io/).

Mayastor leverages NVMe drives and NVMe over Fabric (including NVMe over TCP) to offer
a replicated storage and good performances on bare metal clusters.

Mayastor authors claim that kernel is too slow (is overwhelmed by interrupts) dealing with NVMe drives in high load situations.
So they have pods running in "user space" thus actively eating 100% of a CPU core on each Mayastor node to deal with I/O.

On top of that Mayastor requires at least 1 GB of Huge Pages in RAM.

Disclaimer: if you only have a 1 GbE network, it is probably useless since NVMe drives are so much faster than network :-).

OpenEBS Mayastor introduction video: https://youtu.be/EpDxWwiQp3Q

Note: The OpenEBS team is extremely friendly and helpful on Slack (Kubernetes slack, #openebs channel)

### Benchmark disks and network

Let's start first with a benchmark of disks and network.

Benchmark disks with the cdm_fio.sh script that is performing a CrystalDiskMark-like test using the ``fio`` utility.
```bash
./cdm_fio.sh /path/to/dir/on/disk_to_be_tested
```
If you have strange bash problems (and have an empty report), you can try analyzing the ``.fiomark.txt`` file generated by ``cdm_fio.sh``:
```yaml
python cdm_fio_analyze.py .fiomark.txt
```

Here are the results on a Western Digital Black SN750 NVMe SSD:
```text
Sequential Read: 2270MB/s IOPS=2
Sequential Write: 1747MB/s IOPS=1

512KB Read: 1756MB/s IOPS=3512
512KB Write: 1383MB/s IOPS=2767

Sequential Q32T1 Read: 3047MB/s IOPS=95
Sequential Q32T1 Write: 2192MB/s IOPS=68

4KB Read: 43MB/s IOPS=11116
4KB Write: 233MB/s IOPS=59891

4KB Q32T1 Read: 936MB/s IOPS=239619
4KB Q32T1 Write: 636MB/s IOPS=163024

4KB Q8T8 Read: 1286MB/s IOPS=329341
4KB Q8T8 Write: 1253MB/s IOPS=320794
```
That's pretty nice.

Benchmark network performance between machines:
```bash
ansible k8s -b -m package -a "name=iperf3 state=present"
```
On machine 1 (iperf server):
```text
iperf3 -s -f g
```
On machine 2 (iperf client):
```bash
iperf3 -c 192.168.1.36 -f g
```
They should display something like this:
```text
[  4]   0.00-10.00  sec  1.09 GBytes  0.93 Gbits/sec    0             sender
[  4]   0.00-10.00  sec  1.08 GBytes  0.93 Gbits/sec                  receiver
```
So 1 GbE performance. No surprise.

### Prerequisites

Here in the video: https://youtu.be/EpDxWwiQp3Q?t=2254
Official doc:
- https://mayastor.gitbook.io/introduction/quickstart/prerequisites
- https://mayastor.gitbook.io/introduction/quickstart/preparing-the-cluster

First let's check the huge pages configuration of the machine
```bash
ansible k8s -a "grep -i Hugepage /proc/meminfo"
```
It is likely to show something like this (huge pages size = 2MB and total number of pages = 0):
```text
AnonHugePages:         0 kB
ShmemHugePages:        0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
```

Let's specify 512 pages of 2048 MB each:
```bash
ansible k8s -b -m sysctl -a "name=vm.nr_hugepages value='512'"
```
Now you should have something like this:
```bash
ansible k8s -a "grep -i Hugepage /proc/meminfo"
```
```text
AnonHugePages:         0 kB
ShmemHugePages:        0 kB
HugePages_Total:     512
HugePages_Free:      512
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
```
Unfortunalely you have to restart the kubelet. Let's do it the hard way because I don't know how do it the right way:
```bash
ansible k8s -b -a "reboot now"
```
You have to make sure your kernel version is at least 5.3 (mayastor project is testing on Ubuntu with kernel 5.4):
```bash
ansible k8s -a "uname -r"
```
If it is not the case, and if you're running Ubuntu 18.04, you can do this:
```bash
ansible k8s -b -m package -a "name=linux-generic-hwe-18.04 state=present"
ansible k8s -b -m reboot
```

You need to activate the nvme_tcp kernel module (assuming you have mvme drives of course):
```bash
ansible k8s -b -m community.general.modprobe -a "name=nvme_tcp state=present"
```

You need the iSCSI client installed:
```bash
ansible k8s -b -m package -a "name=open-iscsi state=present"
ansible k8s -b -m service -a "name=iscsid enabled=yes state=started"
```
### Deploy mayastor

Official doc: https://mayastor.gitbook.io/introduction/quickstart/deploy-mayastor

Now label mayastor nodes:
```bash
kubectl label node node1 openebs.io/engine=mayastor
kubectl label node node2 openebs.io/engine=mayastor
kubectl label node node3 openebs.io/engine=mayastor
```
Create the mayastor application resources (namespace, RBAC & CRD):
```bash
kubectl create namespace mayastor
kubectl create -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/moac-rbac.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/csi/moac/crds/mayastorpool.yaml
```
Deploy Mayastor dependencies (NATS):
```bash
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/nats-deployment.yaml
```
Check NATS is running:
```bash
kubectl -n mayastor get pods --selector=app=nats
```
```text
NAME                    READY   STATUS    RESTARTS   AGE
nats-6fdd6dfb4f-l62bw   1/1     Running   0          2m45s
```

Deploy Mayastor CSI Node Plugin:
```bash
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/csi-daemonset.yaml
```

Check CSI daemon set is running (300 MB download per node):
```bash
kubectl -n mayastor get daemonset mayastor-csi
```
```text
NAME           DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR              AGE
mayastor-csi   3         3         3       3            3           kubernetes.io/arch=amd64   8m9s
```

Deploy Mayastor control plane:
```bash
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/moac-deployment.yaml
```
Check control plane is running:
```bash
kubectl get pods -n mayastor --selector=app=moac
```
```text
moac-5cc949c7bb-nqt79   3/3     Running   0          5m28s
```

Deploy Mayastor data plane:
```bash
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/mayastor-daemonset.yaml
```
Check data plane is running:
```bash
kubectl -n mayastor get daemonset mayastor
```
```text
NAME       DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR                                         AGE
mayastor   3         3         3       3            3           kubernetes.io/arch=amd64,openebs.io/engine
```

For each resulting Mayastor pod instance, a Mayastor Node (MSN) custom resource definition should be created.
List these definitions and verify that the count meets the expected number and that all nodes are reporting their State as online:
```bash
kubectl -n mayastor get msn
```
```text
NAME        STATE    AGE
minicube1   online   87s
minicube2   online   94s
minicube3   online   2m48s
```

At this point you should see (and this is normal and expected) Mayastor eating 1 or 2 CPU cores:
```bash
$ top
[...]
  PID UTIL.     PR  NI    VIRT    RES    SHR S  %CPU %MEM    TEMPS+ COM.                                  
 8510 root      20   0 64,519g  28700  11928 R  99,7  0,1   2:02.63 mayastor     ```
```


### Configure mayastor


Official doc: https://mayastor.gitbook.io/introduction/quickstart/configure-mayastor

Video: https://youtu.be/EpDxWwiQp3Q?t=3262

Let's create one Mayastor pool on each node using this ``mayastor-nvme-pools.yml`` file:
```yaml
---
apiVersion: "openebs.io/v1alpha1"
kind: MayastorPool
metadata:
  name: maya-nvme-pool-minicube1
  namespace: mayastor
spec:
  node: minicube1
  disks: ["/dev/nvme0n1"]
---
apiVersion: "openebs.io/v1alpha1"
kind: MayastorPool
metadata:
  name: maya-nvme-pool-minicube2
  namespace: mayastor
spec:
  node: minicube2
  disks: ["/dev/nvme0n1"]
---
apiVersion: "openebs.io/v1alpha1"
kind: MayastorPool
metadata:
  name: maya-nvme-pool-minicube3
  namespace: mayastor
spec:
  node: minicube3
  disks: ["/dev/nvme0n1"]
```
Note that we're using a partition (``nvme0n1p1``) and not the whole disk (``nvme0n1`` ).

Now let's list the pools (``msp`` is a shorthand for ``mayastorpools``):
```bash
kubectl -n mayastor get msp
```
```text
NAME                       NODE        STATE    AGE
maya-nvme-pool-minicube1   minicube1   online   40s
maya-nvme-pool-minicube2   minicube2   online   40s
maya-nvme-pool-minicube3   minicube3   online   40s
```
If you describe one of them:
```bash
kubectl -n mayastor describe msp maya-nvme-pool-minicube1 | tail -8
```
```text
Status:
  Capacity:  249804357632
  Disks:
    uring:///dev/nvme0n1p1?uuid=9e22db45-76b9-4eeb-bc67-3b73726ee4ea
  Reason:  
  State:   online
  Used:    0
Events:    <none>
```
We see that we're using the uring scheme and not the nvme scheme.
Possible schemes are described here: https://mayastor.gitbook.io/introduction/quickstart/configure-mayastor

That's probably because my cluster has been rebooted before the mayastor deployment and the nvme_tcp module is gone:
```bash
$ lsmod | grep nvme
nvme                   45056  1
nvme_core             102400  2 nvme
```

We'll see that later on. It is the opportunity to test the ``iscsi`` performance.

Now let's create a Storage Class using the ``mayastor-iscsi-storage-class.yml`` file:
```yaml
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: mayastor-iscsi
parameters:
  # Set the number of data replicas ("replication factor")
  repl: '1'
  # Set the export transport protocol
  protocol: 'iscsi'
provisioner: io.openebs.csi-mayastor
```
```bash
kubectl create -f mayastor/mayastor-iscsi-storage-class.yml
```

### Deploy a test application

Official doc: https://mayastor.gitbook.io/introduction/quickstart/deploy-a-test-application

Create a PVC using this ``mayastor-isci-pvc.yml`` file:
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: ms-volume-claim
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: mayastor-iscsi
```
```bash
kubectl create -f mayastor-isci-pvc.yml
```
Check the status of the PVC:
```bash
kubectl get pvc ms-volume-claim
```
```text
SS     AGE
ms-volume-claim   Bound    pvc-f661f211-c921-4507-8748-21a9fcdc9e7b   1Gi        RWO            mayastor-iscsi   5s
```
Check the persistent volume:
```bash
kubectl get pv pvc-f661f211-c921-4507-8748-21a9fcdc9e7b
```
```text
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                     STORAGECLASS     REASON   AGE
pvc-f661f211-c921-4507-8748-21a9fcdc9e7b   1Gi        RWO            Delete           Bound    default/ms-volume-claim   mayastor-iscsi            119s
```
Check the Mayastor Volume is healthy:
```bash
kubectl get -n mayastor msv
```
```text
NAME                                   TARGETS   SIZE         STATE     AGE
f661f211-c921-4507-8748-21a9fcdc9e7b             1073741824   healthy   3m18s
```

Deploy the ``fio`` test pod:
```bash
kubectl apply -f https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/fio.yaml
```
Wait for it to be running:
```bash
watch kubectl get pods -o wide
```
```text
NAME   READY   STATUS    RESTARTS   AGE   IP             NODE        NOMINATED NODE   READINESS GATES
fio    1/1     Running   0          86s   10.233.90.23   minicube3   <none>           <none>
```
Note that the volume is mounted in ``/volume`` and the filesystem is ``xfs``.

Run the test:
```bash
kubectl exec -it fio -- fio --loops=1 --size=1024m --filename=/volume/.fiomark.tmp --stonewall --ioengine=libaio --direct=1 --zero_buffers=0 --output-format=json   --name=Bufread --loops=1 --bs=1024m --iodepth=1 --numjobs=1 --rw=readwrite   --name=Seqread --bs=1024m --iodepth=1 --numjobs=1 --rw=read   --name=Seqwrite --bs=1024m --iodepth=1 --numjobs=1 --rw=write   --name=512kread --bs=512k --iodepth=1 --numjobs=1 --rw=read   --name=512kwrite --bs=512k --iodepth=1 --numjobs=1 --rw=write   --name=SeqQ32T1read --bs=32m --iodepth=32 --numjobs=1 --rw=read   --name=SeqQ32T1write --bs=32m --iodepth=32 --numjobs=1 --rw=write   --name=4kread --bs=4k --iodepth=1 --numjobs=1 --rw=randread   --name=4kwrite --bs=4k --iodepth=1 --numjobs=1 --rw=randwrite   --name=4kQ32T1read --bs=4k --iodepth=32 --numjobs=1 --rw=randread   --name=4kQ32T1write --bs=4k --iodepth=32 --numjobs=1 --rw=randwrite   --name=4kQ8T8read --bs=4k --iodepth=8 --numjobs=8 --rw=randread   --name=4kQ8T8write --bs=4k --iodepth=8 --numjobs=8 --rw=randwrite > .fiomark.txt
python cdm_fio_analyze.py .fiomark.txt
```
Result is:
```text
Sequential Read: 111MB/s IOPS=0
Sequential Write: 110MB/s IOPS=0

512KB Read: 97MB/s IOPS=195
512KB Write: 98MB/s IOPS=197

Sequential Q32T1 Read: 111MB/s IOPS=3
Sequential Q32T1 Write: 110MB/s IOPS=3

4KB Read: 11MB/s IOPS=3066
4KB Write: 16MB/s IOPS=4289

4KB Q32T1 Read: 106MB/s IOPS=27283
4KB Q32T1 Write: 106MB/s IOPS=27298

4KB Q8T8 Read: 107MB/s IOPS=27605
4KB Q8T8 Write: 108MB/s IOPS=27768
```
Obviously all tests but ``4KB Read`` and ``4KB Write`` are bottlnecked by the 1 GbE network.

Still read results are decent compared to a consumer-grade Samsung QVO SATA SSD:
```text
4KB Read: 34 MB/s IOPS=8904
4KB Write: 144 MB/s IOPS=37096
```
Let's start the pod on the other nodes to check if we can find where our volume actually is.

So delete pod and download the pod manifest:
```bash
bubectl delete pod fio
wget https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/fio.yaml
```
Then edit it to add ``nodeName`` right below the spec:
```yaml
kind: Pod
apiVersion: v1
metadata:
  name: fio
spec:
  nodeName: minicube1
[...]
```
And create it once again:
```bash
kubectl create -f fio.yaml
```
Run the test:
```bash
kubectl exec -it fio -- fio --loops=1 --size=1024m --filename=/volume/.fiomark.tmp --stonewall --ioengine=libaio --direct=1 --zero_buffers=0 --output-format=json   --name=Bufread --loops=1 --bs=1024m --iodepth=1 --numjobs=1 --rw=readwrite   --name=Seqread --bs=1024m --iodepth=1 --numjobs=1 --rw=read   --name=Seqwrite --bs=1024m --iodepth=1 --numjobs=1 --rw=write   --name=512kread --bs=512k --iodepth=1 --numjobs=1 --rw=read   --name=512kwrite --bs=512k --iodepth=1 --numjobs=1 --rw=write   --name=SeqQ32T1read --bs=32m --iodepth=32 --numjobs=1 --rw=read   --name=SeqQ32T1write --bs=32m --iodepth=32 --numjobs=1 --rw=write   --name=4kread --bs=4k --iodepth=1 --numjobs=1 --rw=randread   --name=4kwrite --bs=4k --iodepth=1 --numjobs=1 --rw=randwrite   --name=4kQ32T1read --bs=4k --iodepth=32 --numjobs=1 --rw=randread   --name=4kQ32T1write --bs=4k --iodepth=32 --numjobs=1 --rw=randwrite   --name=4kQ8T8read --bs=4k --iodepth=8 --numjobs=8 --rw=randread   --name=4kQ8T8write --bs=4k --iodepth=8 --numjobs=8 --rw=randwrite > .fiomark.txt
python ../cdm_fio_analyze.py .fiomark.txt
```
Result is:
```text
Sequential Read: 583 MB/s IOPS=1
Sequential Write: 1430 MB/s IOPS=1

512KB Read: 942 MB/s IOPS=1884
512KB Write: 1238 MB/s IOPS=2476

Sequential Q32T1 Read: 262 MB/s IOPS=8
Sequential Q32T1 Write: 1553 MB/s IOPS=49

4KB Read: 30 MB/s IOPS=7870
4KB Write: 53 MB/s IOPS=13659

4KB Q32T1 Read: 338 MB/s IOPS=86745
4KB Q32T1 Write: 220 MB/s IOPS=56545

4KB Q8T8 Read: 292 MB/s IOPS=74787
4KB Q8T8 Write: 219 MB/s IOPS=56244
```
This time we have been lucky: the volume is probably on the same node as the pod since performance figures are much better.

Performances are less than those observed when benchmarking the disk directly though.

Delete the pod and the pvc:
```bash
kubectl delete pod fio
kubectl delete pvc ms-volume-claim
```
Then list pv shows that the reclaim policy is working well:
```bash
kubectl get pv
```
```text
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS     CLAIM                     STORAGECLASS     REASON   AGE
pvc-ca85c6fb-7e91-4406-9065-b81ae2832ec6   10Gi       RWO            Delete           Released   default/ms-volume-claim   mayastor-iscsi            3h19m
```
```bash
kubectl get pv
```
```text
No resources found in default namespace.
```


### Reducing the CPU limits of Mayastor

This can be achieved by changing the limits of pods of the Mayastor data plane:
```bash
wget https://raw.githubusercontent.com/openebs/Mayastor/master/deploy/mayastor-daemonset.yaml
kubectl delete -f mayastor-daemonset.yaml
```
Set limits.cpu and limits.requests to "500m" instead of 1:
```yaml
        resources:
          # NOTE: Each container must have mem/cpu limits defined in order to
          # belong to Guaranteed QoS class, hence can never get evicted in case of
          # pressure unless they exceed those limits. limits and requests must be the same.
          limits:
            cpu: "500m"
            memory: "512Mi"
            hugepages-2Mi: "1Gi"
          requests:
            cpu: "500m"
            memory: "512Mi"
            hugepages-2Mi: "1Gi"
```
Recreate the daemonset:
```bash
kubectl apply -f  mayastor-daemonset.yaml
```

But consequences are dire since performances are directly cut by 2 (so let's forget that):
```text
Sequential Read: 58 MB/s IOPS=0
Sequential Write: 57 MB/s IOPS=0

512KB Read: 49 MB/s IOPS=98
512KB Write: 48 MB/s IOPS=96

Sequential Q32T1 Read: 58 MB/s IOPS=2
Sequential Q32T1 Write: 57 MB/s IOPS=2

4KB Read: 5 MB/s IOPS=1340
4KB Write: 6 MB/s IOPS=1666

4KB Q32T1 Read: 51 MB/s IOPS=13068
4KB Q32T1 Write: 51 MB/s IOPS=13209

4KB Q8T8 Read: 51 MB/s IOPS=13071
4KB Q8T8 Write: 51 MB/s IOPS=13251
```

### Trying to get NVMe over Fabrics working

Make sure the nvme_tcp kernel module is loaded during boot:
```bash
ansible k8s -b -m lineinfile -a "path=/etc/modules regexp=nvme_tcp line=nvme_tcp"
ansible k8s -b -m reboot
```

Delete the iscsi storage class:
```bash
kubectl delete -f mayastor-iscsi-storage-class.yml
```

Let's create an ``nvmf`` Storage Class using the ``mayastor-nvmf-storage-class.yml`` file:
```yaml
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: mayastor-nvmf
parameters:
  # Set the number of data replicas ("replication factor")
  repl: '1'
  # Set the export transport protocol
  protocol: 'nvmf'
provisioner: io.openebs.csi-mayastor
```
```bash
kubectl create -f mayastor/mayastor-iscsi-storage-class.yml
```

Now create an ``nvmf`` pvc using the ``mayastor-nvmf-pvc.yml`` file:
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: ms-volume-claim
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
  storageClassName: mayastor-nvmf
```
Create the pod and run the benchmark as before.
Please note that, this time, the volume is unfortunately sitting on the waekest machine.

Volume and pod on different nodes:
```text
Sequential Read: 110 MB/s IOPS=0
Sequential Write: 110 MB/s IOPS=0

512KB Read: 100 MB/s IOPS=200
512KB Write: 98 MB/s IOPS=197

Sequential Q32T1 Read: 111 MB/s IOPS=3
Sequential Q32T1 Write: 111 MB/s IOPS=3

4KB Read: 12 MB/s IOPS=3318
4KB Write: 12 MB/s IOPS=3266

4KB Q32T1 Read: 108 MB/s IOPS=27861
4KB Q32T1 Write: 107 MB/s IOPS=27525

4KB Q8T8 Read: 109 MB/s IOPS=28036
4KB Q8T8 Write: 108 MB/s IOPS=27805
```

Volume and pod on the same node:
```text
Sequential Read: 1204 MB/s IOPS=1
Sequential Write: 1127 MB/s IOPS=1

512KB Read: 1011 MB/s IOPS=2024
512KB Write: 798 MB/s IOPS=1596

Sequential Q32T1 Read: 1213 MB/s IOPS=38
Sequential Q32T1 Write: 1172 MB/s IOPS=37

4KB Read: 29 MB/s IOPS=7425
4KB Write: 39 MB/s IOPS=10218

4KB Q32T1 Read: 174 MB/s IOPS=44582
4KB Q32T1 Write: 151 MB/s IOPS=38716

4KB Q8T8 Read: 228 MB/s IOPS=58618
4KB Q8T8 Write: 245 MB/s IOPS=62962

```


```bash
ansible -b k8s -m community.general.parted -a "device=/dev/nvme0n1 number=1 state=present part_end=50%"
ansible -b k8s -m community.general.parted -a "device=/dev/nvme0n1 number=2 state=present part_start=50%"
```

```bash
ansible -b k8s -m community.general.parted -a "device=/dev/nvme0n1 number=2 state=absent"
ansible -b k8s -m community.general.parted -a "device=/dev/nvme0n1 number=1 state=absent"
```

## Dynamic Local PV provisioning with OpenEBS

Oficial doc of Local PV: https://kubernetes.io/blog/2019/04/04/kubernetes-1.14-local-persistent-volumes-ga/
Official doc of OpenEBS Local PV helm chart: https://openebs.github.io/dynamic-localpv-provisioner/

Local PVs are special volumes that are guaranteed to be on the same node as the pod requesting it.
Unlike Hostpath PVs, Kubernetes knows that a Local PV is on the node, so it won't move your pod away
from the node.

Those PV are (only?) useful for applications that deal with data replication and high-availability by themselves. 
Elasticsearch might be a good example: 
- it will replicate its own data and does not expect the "storage layer" to do it,
- if an Elasticsearch pod goes down then Elasticsearch can keep on running anyway.
See 'Use Cases' paragraph: https://docs.openebs.io/docs/next/localpv.html

Add the OpenEBS Dynamic LocalPV Provisioner chart repo:
```bash
helm repo add openebs-localpv https://openebs.github.io/dynamic-localpv-provisioner
```
Run helm repo update:
```bash
helm repo update
```

Install the OpenEBS Dynamic LocalPV Provisioner chart (default base path for volumes will be ``/var/openebs/local``):
```bash
helm install openebs-localpv openebs-localpv/localpv-provisioner -n openebs
```

If you want to change the default location of volumes, run (not tested!):
```bash
helm install openebs-localpv --set hostpathClass.basePath=/mnt/data/openebs/local openebs-localpv/localpv-provisioner -n openebs
```

At the time of writing the documentation was out-of-date and did not mention this ``hostpathClass.basePath`` parameter 
(see https://kubernetes.slack.com/archives/CUAKPFU78/p1618156947021900) so, as a workaround, I did this (generate the manifest, edit it and apply it):
```bash
helm template openebs-localpv openebs-localpv/localpv-provisioner -n openebs > openebs-localpv.yaml
sed -i s,/var/openebs/local,/mnt/data/openebs/local,g openebs-localpv.yaml
kubectl -n openebs apply -f openebs-localpv.yaml
```

Then you can write PVCs like this:
```yaml
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: local-hostpath-pvc
spec:
  storageClassName: openebs-hostpath
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5G
```

Uninstall:
```bash
helm -n openebs uninstall openebs-localpv
```

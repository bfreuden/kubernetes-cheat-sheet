
This is a Kubernetes cheat sheet.

Official documentation:

https://kubernetes.io/fr/docs/home/

# Kubectl

## Installation

Official doc is here:

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

# Minikube

Minikube is a virtual machine containing a single-node Kubernetes cluster.

It's fine but it takes a long time to start and consumes a lot of memory (since it is a VM).

For testing purpose K3s seems to be easier and far less CPU and memory consuming.

(TODO)

# K8s with vagrant

It seems quite common to use vagrant to install multi-node clusters, each node running in a VM.

https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/

(TODO)

# K3s

K3s is a lightweight certified Kubernetes distribution.

It is using less CPU than K8s and memory footprint is low enough to fit in a Raspberry Pi.

https://k3s.io/

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

Then on you laptop you can run (replace **server** and **password**):
```bash
kubectl config set-cluster k3s --server=https://server:6443
kubectl config set-credentials k3s-admin --username=admin --password=password
kubectl config set-context k3s  --cluster=k3s --user=k3s-admin
kubectl config use-context k3s
```

Finally manually add certificate-authority-data (there must be a better way to do it) in the k3s cluster section of .kube/config
```yaml
- cluster:
    server: https://vision:6443
    certificate-authority-data: base64data
  name: k3s
```

Then use the k3s context:
```bash
kubectl use-context k3s
```

### Kubernetes dashboard

Official page of the Kubernetes dashboard:

https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

Official K3s installation instructions:

https://rancher.com/docs/k3s/latest/en/installation/kube-dashboard/

I've not been able to **access** the dashboard after installation.

I was having errors like this:
```text
Error: 'dial tcp 192.168.1.2:8443: i/o timeout
```

There are many ways to access it but I've not been able to find the magic formula:

https://github.com/kubernetes/dashboard/blob/master/docs/user/accessing-dashboard/1.7.x-and-above.md

I tested the solution mentioned at the end of the thread, but no luck:

https://github.com/kubernetes-sigs/kubespray/issues/5347

No luck neither with this one:

https://www.thegeekdiary.com/how-to-access-kubernetes-dashboard-externally/

Pretty detailed information about getting started with the dashboard (not tested):

https://www.youtube.com/watch?v=brqAMyayjrI

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


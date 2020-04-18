
This is a Kubernetes cheat sheet.

Official documentation:

https://kubernetes.io/fr/docs/home/

A huge YouTube Kubernetes playlist:

https://www.youtube.com/playlist?list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0

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

Official Minikube install:

https://kubernetes.io/fr/docs/tasks/tools/install-minikube/


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
kubectl config use-context k3s
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

# K8s

## Install with kubespray

Official documentation:

https://kubernetes.io/docs/setup/production-environment/tools/kubespray/

According to the kubespray quick start, it seems to be a better choice to use an Ansible
installed using pip rather than installing ansible from your linux distribution packages:

https://kubespray.io/#/?id=quick-start

For Ansible installation using Python, see: 

https://github.com/bfreuden/ansible-cheat-sheet#using-python

Make sure you're using ansible and ansible-playbook from your python env:
```bash
which ansible
which ansible-playbook
```

Make sure you're using ansible 2.5 or higher:
```bash
ansible --version
```

Configure managed machines for Ansible, see:

https://github.com/bfreuden/ansible-cheat-sheet#managed-machines

Make sure IPv4 forwarding is setup on all machines of the cluster (must return 1):

```bash
ansible all -a "sysctl net.ipv4.ip_forward"
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

Then you certainly want to edit the ``inventory/mycluster/hosts.yaml`` file to replace node1, node2 and node3
with actual hostnames of the machines because Kubespray will actually rename your machines to node1, node2 and node3!

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

CPU usage is around 15% of a core with a idle cluster.

## Add to kubectl config

Get the kube config from the master:
```bash
ansible -b -i inventory/mycluster/hosts.yaml node1 -m fetch -a "src=/etc/kubernetes/admin.conf flat=true dest=./"
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
Note that we leveraging the KUBECONFIG environment variable that is containing a list of config files.
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

Get cluster info:
```bash
kubectl cluster-info
```
Get Kubernetes pods:
```bash
kubectl -n kube-system get pods
```
Now let's check the network communications (--rm to remove when we are done):
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
kubectl get nodes
kubectl get nodes -o wide
```
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


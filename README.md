
This is a Kubernetes cheat sheet.

Official documentation:

https://kubernetes.io/fr/docs/home/

A huge YouTube Kubernetes playlist and a huge **thank you** to the author of the playlist (this cheat sheet is based on this great content):

https://www.youtube.com/playlist?list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0

- [Kubectl](#kubectl)
  * [Installation](#installation)
  * [Setup bash completion](#setup-bash-completion)
- [Minikube](#minikube)
- [Microk8s](#microk8s)
- [K8s with vagrant](#k8s-with-vagrant)
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
  * [ClusterIP vs. NodePort](#clusterip-vs-nodeport)
  * [Kubernetes Dashboard](#kubernetes-dashboard)
- [Learn Kubernetes](#learn-kubernetes)
  * [Running docker containers](#running-docker-containers)
  * [Pod, replicaset and deployment](#pod--replicaset-and-deployment)
    + [Pod](#pod)
    + [Replicaset](#replicaset)
    + [Deployment](#deployment)
  * [Namespaces](#namespaces)
  * [Node Selectors](#node-selectors)
  * [PodNodeSelector Admission Control Plugin](#podnodeselector-admission-control-plugin)
  * [DaemonSets](#daemonsets)
  * [Jobs and cronjobs](#jobs-and-cronjobs)
    + [Jobs](#jobs)
    + [Cronjobs](#cronjobs)
  * [TTL Controller for Finished Resources](#ttl-controller-for-finished-resources)
  * [Init containers](#init-containers)
  * [Persistent volumes and claims](#persistent-volumes-and-claims)
    + [HostPath](#hostpath)
    + [NFS Volumes](#nfs-volumes)
  * [Getting started with Helm](#getting-started-with-helm)
    + [Installing Helm](#installing-helm)
    + [Installing Helm 2.x](#installing-helm-2x)
    + [Migrating from Helm 2.x](#migrating-from-helm-2x)
  * [Installing Jenkins in Kubernetes using Helm](#installing-jenkins-in-kubernetes-using-helm)
  * [Configuring Jenkins to connect to Kubernetes](#configuring-jenkins-to-connect-to-kubernetes)
  * [Jenkins CI CD Pipeline in Kubernetes](#jenkins-ci-cd-pipeline-in-kubernetes)
  * [Dynamically provision NFS persistent volumes](#dynamically-provision-nfs-persistent-volumes)
  * [Secrets](#secrets)
  * [Statefulsets](#statefulsets)
    + [Create NFS shares](#create-nfs-shares)
    + [Create PVs](#create-pvs)
    + [Create Statefulset](#create-statefulset)
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
    + [Demo](#demo)
    + [Uninstall MetalLB](#uninstall-metallb)
  * [Using Horizontal Pod Autoscaler](#using-horizontal-pod-autoscaler)
    + [Metrics-server installation](#metrics-server-installation)
    + [Setup HPA demo](#setup-hpa-demo)
    + [Demo HPA](#demo-hpa)
  * [Pod auto-scaling based on memory utilization](#pod-auto-scaling-based-on-memory-utilization)
  * [Useful Tools - kube-ops-view and kubebox](#useful-tools---kube-ops-view-and-kubebox)
    + [kube-ops-view](#kube-ops-view)
    + [kubebox](#kubebox)

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

## Setup bash completion

Do it. It's great. I mean it.

Official documentation:

https://kubernetes.io/docs/tasks/tools/install-kubectl/#enabling-shell-autocompletion

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

(TODO)

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
Note that we leveraging the ``KUBECONFIG`` environment variable that is containing a list of config files.
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
kubectl get nodes
kubectl get nodes -o wide
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
kubectl create -f /tmp/nginx.yml -f /tmp/nginx-svc.yml
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

Now let's ssh on master machine(s) and edit the :
```bash
ssh user@node1
sudo vi /etc/kubernetes/manifests/kube-scheduler.yaml
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

Access Mode:
* RWO: (read-write once) only the first node (?) will be able to write, others will only be able to read 
* RWM: (read-write many) all nodes can read and write
* RO: read-only

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
So we can see HostPath has a lot of constraints...

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


### Installing Helm 2.x

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

## Dynamically provision NFS persistent volumes

https://youtu.be/AavnQzWDTEk?t=63

In the previous sections we saw that that when a cluster user creates a PVC, the cluster administrator has
to manually create PVs. This is time consuming.

When using Kubernetes in the cloud, there is the notion of dynamic provisioning:
* you make a volume claim
* a volume is created automatically
* you delete your app and your claim
* the volume is automatically deleted

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

Statefulsets are pods with a unique name, a unique network identity, a unique stable storage and an ordered provisioning.

Unique name: if the stateful set is called ``web``, pods will be called ``web-0``, ``web-1``, ``web-2``, ``web-3``

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
ansible-playbook site2.yml
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
  labels:                # it will link all pods of the statefulset
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

It looks pretty much like secrets (see above).

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

Rules are based on Prometheus so you have the enable metrics (see above). 
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

The video is about the latter.
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
kubectl delete -f nginx-ingress.yaml
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
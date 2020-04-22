
This is a Kubernetes cheat sheet.

Official documentation:

https://kubernetes.io/fr/docs/home/

A huge YouTube Kubernetes playlist:

https://www.youtube.com/playlist?list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0

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

# Learn Kubernetes

The content of this paragraph is directly coming from this playlist:

https://www.youtube.com/playlist?list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0

The author has done a marvelous job with that video series. I'm thanking him for that.

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


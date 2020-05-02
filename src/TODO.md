
## Dynamically provision NFS persistent volumes

https://youtu.be/AavnQzWDTEk?t=63

(todo)

In the previous sections we saw that when a cluster user creates a PVC, the cluster administrator has
to manually create PVs. This is time consuming.

When using Kubernetes in the cloud, there is the notion of dynamic provisioning:
* you make a volume claim
* a volume is created automatically
* you delete your app and your claim
* the volume is automatically deleted

## Using Vertical Pod Autoscaling

https://www.youtube.com/watch?v=fLXqEUI_WRg&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=78

(todo)

## Creating your first Helm chart 

https://www.youtube.com/watch?v=3GPpm2nZb2s&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=84

(todo)

## Kubernetes RBAC Demo | Creating Users and Roles 

https://www.youtube.com/watch?v=U67OwM-e9rQ&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=93

(todo)

## Using Private Docker Registry in Kubernetes 

https://www.youtube.com/watch?v=r15S2tBevoE&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=94

(todo)

## Deploying Spinnaker in Kubernetes cluster 

https://www.youtube.com/watch?v=9EUyMjR6jSc&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=95

(todo)

## Kubernetes Liveness & Readiness Probes 

https://www.youtube.com/watch?v=3TJRkKWuVoM&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=107

(todo)

## How to set up a local Helm chart repository

https://www.youtube.com/watch?v=hSk_r-CCvLE&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=85

(todo)


##  Using PodPreset

https://www.youtube.com/watch?v=LwW6KafpTKM&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=65

(todo)

## Setting Pod limits on Kubernetes worker nodes 

https://www.youtube.com/watch?v=0zENTHMGjFY&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=92

(todo)


## K9S Kubernetes Terminal Dashboard 

https://www.youtube.com/watch?v=wEQJi7_4V9Q&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=82

(todo)

## Extending Kubernetes through Plugins usig Krew

https://www.youtube.com/watch?v=-HMbSqEQPpk&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=83

(todo)


## Istio

(todo ?)


## Kubespray - Upgrading K8S Cluster

https://www.youtube.com/watch?v=M499ckeGZL8&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=87

(todo)

## Kubespray - Adding & Removing Kubernetes nodes

https://www.youtube.com/watch?v=duAvUhNydh4&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=88

(todo)

## Kubespray - Configuring external Load Balancer 

https://www.youtube.com/watch?v=u_1f3WyvtQE&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=90

(todo)

## Provisioning Kubernetes The Easy Way with Juju 

https://www.youtube.com/watch?v=baSTkU38sC8&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=91

(todo)

## Kontena Lens - Beautiful Kubernetes UI

https://www.youtube.com/watch?v=YGgaiGdYfdI&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=97

(todo)

## Weave Scope - Kubernetes Visualization & Monitoring

https://www.youtube.com/watch?v=hhp-V7ty3w4&list=PL34sAs7_26wNBRWM6BDhnonoA5FMERax0&index=62

Show dependencies between elements of the cluster

## Elasticsearch

There are several ways to install Elasticsearch on Kubernetes:
* Elastic Cloud on : a Kubernetes operator for Elasticsearch Kibana Filebeat etc...
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
        node.ingest: false  # disable ingest
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
There should be nothing left:
```bash
kubectl get elastic
```

### Official Elasticsearch Helm chart

https://hub.helm.sh/charts/elastic/elasticsearch

### Bitnami Elasticsearch Helm chart

https://hub.helm.sh/charts/bitnami/elasticsearch


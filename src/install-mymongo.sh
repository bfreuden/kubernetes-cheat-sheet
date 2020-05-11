#!/bin/bash
echo "creating pvs"
kubectl create -f mongodb-hostpath-pvs.yaml
echo "installing chart"
helm install --namespace mongodb -f mymongo-values-personal.yaml mymongo bitnami/mongodb
echo "waiting (no timeout) for mymongo-mongodb-primary-0 to be ready"
kubectl -n mongodb wait pod/mymongo-mongodb-primary-0 --for=condition=Ready --timeout=-1s
echo "waiting (no timeout) for mymongo-mongodb-secondary-0 to be ready"
kubectl -n mongodb wait pod/mymongo-mongodb-secondary-0 --for=condition=Ready --timeout=-1s
echo "waiting (no timeout) for mymongo-mongodb-arbiter-0 to be ready"
kubectl -n mongodb wait pod/mymongo-mongodb-arbiter-0 --for=condition=Ready --timeout=-1s
echo "creating LoadBalancer"
kubectl -n mongodb patch svc mymongo-mongodb -p '{"spec": {"type": "LoadBalancer"}}'
echo "done"

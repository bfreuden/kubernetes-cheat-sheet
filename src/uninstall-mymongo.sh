#!/bin/bash
echo "uninstalling chart"
helm -n mongodb uninstall mymongo
echo "waiting (no timeout) for mymongo-mongodb-primary-0 to terminate"
kubectl -n mongodb wait pod/mymongo-mongodb-primary-0 --for=delete --timeout=-1s
echo "waiting (no timeout) for mymongo-mongodb-secondary-0 to terminate"
kubectl -n mongodb wait pod/mymongo-mongodb-secondary-0 --for=delete --timeout=-1s
echo "waiting (no timeout) for mymongo-mongodb-arbiter-0 to terminate"
kubectl -n mongodb wait pod/mymongo-mongodb-arbiter-0 --for=delete --timeout=-1s
echo "deleting pvcs"
kubectl -n mongodb delete pvc datadir-mymongo-mongodb-primary-0
kubectl -n mongodb delete pvc datadir-mymongo-mongodb-secondary-0
echo "deleting pvs"
kubectl delete -f mongodb-hostpath-pvs.yaml
echo "cleaning pv directories"
ansible -b node1,node2 -a "rm -rf /var/kubernetes/mongovol0/data"
ansible -b node1,node2 -a "rm -rf /var/kubernetes/mongovol1/data"
echo "done"
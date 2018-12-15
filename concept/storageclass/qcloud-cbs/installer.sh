#!/bin/bash

which envsubst || exit 1


for no in $(seq -w 1 30)
do
    export no
    # cat pvc.yml.tpl |envsubst | kubectl apply -f -
    # cat pod.yml | envsubst | kubectl apply -f -

    cat pvc.yml.tpl |envsubst | kubectl delete -f -
    cat pod.yml | envsubst | kubectl delete -f -
done

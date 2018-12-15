#!/bin/bash

which envsubst || exit 1


for no in $(seq -w 1 2)
do
    export no
    envsubst < alicloud-disk-efficiency-pvc.yml.tpl  | kubectl apply -f -
    envsubst < cat pod.yml.tpl  | kubectl apply -f -

    # envsubst < pod.yml.tpl |  | kubectl delete -f -
    # envsubst < alicloud-disk-efficiency-pvc.yml.tpl | | kubectl delete -f -
done

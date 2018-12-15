#!/bin/bash

export NFS_SERVER=192.168.100.200
export NFS_PATH=/kubernetes

export NAMESPACE=storage-system

export PROJECT_NAME=qcloud-nfs-client-provisioner
export PROVISIONER_NAME=qcloud/shanghai-nas-ssd

export STORAGECLASS_NAME=qcloud-shanghai-nas-ssd 
export STORAGECLASS_ArchiveOnDelete=false  # true or false

export PVC_NAME=test-claim-44

mkdir -p $PROJECT_NAME

which envsubst || exit 1

## nfs-client-provisioner
envsubst < rbac.yaml.tpl > ${PROJECT_NAME}/rbac.yaml
envsubst < deployment-linux.yaml.tpl > ${PROJECT_NAME}/deployment-linux.yaml
# envsubst < deployment-arm.yaml.tpl > ${PROJECT_NAME}/deployment-arm.yaml
envsubst < storageclass.yaml.tpl > ${PROJECT_NAME}/storageclass.yaml

# test
envsubst < test-nfs-pvc.yaml.tpl > ${PROJECT_NAME}/test-nfs-pvc.yaml
envsubst < test-nfs-pod.yaml.tpl > ${PROJECT_NAME}/test-nfs-pod.yaml


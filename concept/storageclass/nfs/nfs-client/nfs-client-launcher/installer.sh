#!/bin/bash

cd $(dirname $0)

export NFS_SERVER=192.168.1.200
export NFS_PATH=/kubernetes

export NAMESPACE=storage-system

export IDC=aliyun
export STORAGECLASS_NAME=${IDC}-hangzhou-nfs-ssd
export STORAGECLASS_ArchiveOnDelete=false  # true or false

export PROJECT_NAME=${STORAGECLASS_NAME}-client-provisioner
export PROVISIONER_NAME=${IDC}/hangzhou-nfs-ssd


export PVC_NAME=test-claim-44

mkdir -p $PROJECT_NAME

which envsubst >/dev/null 2>&1 || exit 1

function storageclass(){
## nfs-client-provisioner
envsubst < rbac.yaml.tpl > ${PROJECT_NAME}/rbac.yaml
envsubst < deployment-linux.yaml.tpl > ${PROJECT_NAME}/deployment-linux.yaml
# envsubst < deployment-arm.yaml.tpl > ${PROJECT_NAME}/deployment-arm.yaml
envsubst < storageclass.yaml.tpl > ${PROJECT_NAME}/storageclass.yaml
}


function client(){
# test

export PVC_NAME=aliyun-nas-pvc01
# export STORAGECLASS_NAME=aliyun-beijing-nas-ssd
envsubst < test-nfs-pvc.yaml.tpl > ${PROJECT_NAME}/test-nfs-pvc.yaml
envsubst < test-nfs-pod.yaml.tpl > ${PROJECT_NAME}/test-nfs-pod.yaml
}

storageclass
client

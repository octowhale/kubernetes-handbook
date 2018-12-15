kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: ${PVC_NAME}
  annotations:
    volume.beta.kubernetes.io/storage-class: "${STORAGECLASS_NAME}"
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 100Mi
#    limits:
#      storage: 1Mi

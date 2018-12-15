apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: cbs-test-pvc-${no}
  # annotations:
  #   volume.beta.kubernetes.io/storage-class: alicloud-disk-efficiency
spec:
  accessModes:
    # - ReadWriteOnce # RWO
    # - ReadOnlyMany  # ROX
    - ReadWriteMany # RWX
  storageClassName: cbs
  resources:
    requests:
      storage: 20Gi

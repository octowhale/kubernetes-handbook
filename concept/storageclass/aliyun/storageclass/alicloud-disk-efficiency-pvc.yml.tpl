apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: alicloud-disk-efficiency-test-pvc-${no}
  # annotations:
  #   volume.beta.kubernetes.io/storage-class: alicloud-disk-efficiency
spec:
  accessModes:
    - ReadWriteOnce # RWO
    # - ReadOnlyMany  # ROX
    # - ReadWriteMany # RWX
  storageClassName: alicloud-disk-efficiency
  resources:
    requests:
      storage: 20Gi

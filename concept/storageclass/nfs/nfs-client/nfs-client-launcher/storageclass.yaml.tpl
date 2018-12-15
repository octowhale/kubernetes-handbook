apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: ${STORAGECLASS_NAME}
provisioner: ${PROVISIONER_NAME} # or choose another name, must match deployment's env PROVISIONER_NAME'
parameters:
  archiveOnDelete: "${STORAGECLASS_ArchiveOnDelete}"

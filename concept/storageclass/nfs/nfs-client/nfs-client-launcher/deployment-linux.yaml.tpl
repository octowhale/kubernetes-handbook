apiVersion: v1
kind: Namespace
metadata:
  name: ${NAMESPACE}
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: ${PROJECT_NAME}
  namespace: ${NAMESPACE}
---
kind: Deployment
apiVersion: extensions/v1beta1
metadata:
  name: ${PROJECT_NAME}
  namespace: ${NAMESPACE}
spec:
  replicas: 1
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: ${PROJECT_NAME}
    spec:
      serviceAccountName: ${PROJECT_NAME}
      containers:
        - name: ${PROJECT_NAME}
          image: quay.io/external_storage/nfs-client-provisioner:latest
          volumeMounts:
            - name: nfs-client-root
              mountPath: /persistentvolumes
          env:
            - name: PROVISIONER_NAME
              value: ${PROVISIONER_NAME}
            - name: NFS_SERVER
              value: ${NFS_SERVER}
            - name: NFS_PATH
              value: ${NFS_PATH}
      volumes:
        - name: nfs-client-root
          nfs:
            server: ${NFS_SERVER}
            path: ${NFS_PATH}
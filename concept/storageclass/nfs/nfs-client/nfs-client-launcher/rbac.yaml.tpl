kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: ${PROJECT_NAME}-runner
rules:
  - apiGroups: [""]
    resources: ["persistentvolumes"]
    verbs: ["get", "list", "watch", "create", "delete"]
  - apiGroups: [""]
    resources: ["persistentvolumeclaims"]
    verbs: ["get", "list", "watch", "update"]
  - apiGroups: ["storage.k8s.io"]
    resources: ["storageclasses"]
    verbs: ["get", "list", "watch"]
  - apiGroups: [""]
    resources: ["events"]
    verbs: ["create", "update", "patch"]
---
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: run-${PROJECT_NAME}
subjects:
  - kind: ServiceAccount
    name: ${PROJECT_NAME}
    namespace: ${NAMESPACE}
roleRef:
  kind: ClusterRole
  name: ${PROJECT_NAME}-runner
  apiGroup: rbac.authorization.k8s.io
---
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: leader-locking-${PROJECT_NAME}
rules:
  - apiGroups: [""]
    resources: ["endpoints"]
    verbs: ["get", "list", "watch", "create", "update", "patch"]
---
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: leader-locking-${PROJECT_NAME}
subjects:
  - kind: ServiceAccount
    name: ${PROJECT_NAME}
    # replace with namespace where provisioner is deployed
    namespace: ${NAMESPACE}
roleRef:
  kind: Role
  name: leader-locking-${PROJECT_NAME}
  apiGroup: rbac.authorization.k8s.io

apiVersion: v1
data:
  .dockerconfigjson: eyJhdXRocyI6eyJyZWdpc3RyeS5jbi1iZWlqaW5nLmFsaXl1bmNzLmNvbSI6eyJ1c2VybmFtZSI6InJhbV9nN3BheV9hZ2VudEBnN3MiLCJwYXNzd29yZCI6Imc3cGF5ZzdwYXkiLCJhdXRoIjoiY21GdFgyYzNjR0Y1WDJGblpXNTBRR2MzY3pwbk4zQmhlV2MzY0dGNSJ9fX0=
kind: Secret
metadata:
  name: aliyun-registry-key
  namespace: ${Namespace}
type: kubernetes.io/dockerconfigjson
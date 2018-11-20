# 腾讯云CLB

腾讯云默认 `ingress` 是通过 CLB 实现的。

```yaml
metadata:
  annotations:
    description: clb-ingress
    kubernetes.io/ingress.class: qcloud
    # kubernetes.io/ingress.http-rules: '[{"host":"localhost","path":"/","backend":{"serviceName":"non-service","servicePort":65535}}]'
    # kubernetes.io/ingress.https-rules: "null"
    kubernetes.io/ingress.qcloud-loadbalance-id: lb-fwrk6lrb
    kubernetes.io/ingress.rule-mix: "true"
    kubernetes.io/ingress.subnetId: subnet-3klzuh77
```

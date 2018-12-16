# ingress-controller / ingress

> https://kubernetes.io/docs/concepts/services-networking/ingress/

ingress 作为 http 网络入口，承担着非常重要的角色。


## select controller

默认情况下， `kind: Ingress` 中不明确 `kubernetes.io/ingress.class: <value>` , 那么这些规则将会适用到所有 `ingress-controller` 中。

```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
#   annotations:
#     kubernetes.io/ingress.class: nginx-demo
  generation: 1
  name: nginx-demo
spec:
  rules:
  ...
```

### ingress-class

`ingress-class` 在创建 ingress-controller 的时候就已经指定了。

```yaml
spec:
  template:
     spec:
       containers:
         - name: nginx-ingress-internal-controller
           args:
             - /nginx-ingress-controller
             - '--default-backend-service=ingress/nginx-ingress-default-backend'
             - '--ingress-class=nginx'
             - '--configmap=ingress/nginx-ingress-controller'
```

+ https://ieevee.com/tech/2018/05/09/k8s-ingress.html
+ https://github.com/Kong/kubernetes-ingress-controller/blob/master/docs/ingress-class.md
+ https://github.com/Kong/kubernetes-ingress-controller/issues/166
+ https://github.com/kubernetes/ingress-gce/blob/master/examples/PREREQUISITES.md#ingress-class
+ 多个ingress: https://yq.aliyun.com/articles/645856

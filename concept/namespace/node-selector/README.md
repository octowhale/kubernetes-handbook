# namespace assign to nodes

**注意**:
+ 在 `ns.yaml` 中设置 `metadata.annotations` 
+ 声明 `scheduler.alpha.kubernetes.io/node-selector: env=test`

```bash
# label node
k label node <NODE_NAME> env=test

# create namespace
ka -f ns.yml

# create pod in namespace
ka -f dep.yaml
```


## stackoverflow

[how-to-assign-a-namespace-to-certain-nodes](https://stackoverflow.com/questions/52487333/how-to-assign-a-namespace-to-certain-nodes)


To achieve this you can use `PodNodeSelector` admission controller.

First, you need to enable it in your kubernetes-apiserver:

Edit `/etc/kubernetes/manifests/kube-apiserver.yaml`:
find `--enable-admission-plugins=`
add `PodNodeSelector` parameter
Now, you can specify scheduler.alpha.kubernetes.io/node-selector option in annotations for your namespace, example:

```yaml
apiVersion: v1
kind: Namespace
metadata
 name: ns1
 annotations:
   scheduler.alpha.kubernetes.io/node-selector: env=test
spec: {}
status: {}
```

After these steps, all the pods created in this namespace will have this section automatically added:

```yaml
nodeSelector
  env: test
```
More information about the PodNodeSelector you can find in the official Kubernetes documentation: 
https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/#podnodeselector


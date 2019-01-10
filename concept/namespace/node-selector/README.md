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



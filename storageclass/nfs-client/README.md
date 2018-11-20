# NFS-Client Provisioner

> https://github.com/kubernetes-incubator/external-storage/tree/master/nfs-client

## 不足

可以通过 `limit-range` 现在创建 `pvc` 时的 `request` 大小， 但实际上不能限制使用量。

+ limit-range
```bash
#  kg limitranges storagelimits -o yaml
apiVersion: v1
kind: LimitRange
metadata:
  creationTimestamp: 2018-11-20T06:09:41Z
  name: storagelimits
  namespace: tangxin-test
  resourceVersion: "157613"
  selfLink: /api/v1/namespaces/tangxin-test/limitranges/storagelimits
  uid: de579a6a-ec8a-11e8-8aa6-00163e007f0f
spec:
  limits:
  - max:
      storage: 10Mi
    type: PersistentVolumeClaim
```

+ limit-range 限制申请

```bash
#  k create -f 2-nfs-pvc.yaml
Error from server (Forbidden): error when creating "2-nfs-pvc.yaml": persistentvolumeclaims "test-claim-2" is forbidden: maximum storage usage per PersistentVolumeClaim is 10Mi, but request is 20Mi.
```

+ limit-range 不能限制使用

```bash
/usr/share/nginx/html # dd if=/dev/zero of=./10M.zero count=10 bs=1M
10+0 records in
10+0 records out
```

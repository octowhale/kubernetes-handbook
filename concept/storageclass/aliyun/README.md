# aliyun disk storageclass

aliyun 默认提供了 4 中云盘的 StorageClass 。 可以直接通过 PVC 声明。

云盘的声明和使用，受限与云盘本身的功能限制。

```bash
# kg storageclasses.storage.k8s.io
NAME                        PROVISIONER                 AGE
alicloud-disk-available     alicloud/disk               26d
alicloud-disk-common        alicloud/disk               26d
alicloud-disk-efficiency    alicloud/disk               26d
alicloud-disk-ssd           alicloud/disk               26d
```
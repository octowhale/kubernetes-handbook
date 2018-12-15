# storage-class


## limit range

limit-range 限制 用户在 namespace 下声明 pvc 的大小。

> https://kubernetes.io/docs/tasks/administer-cluster/limit-storage-consumption/

需要注意的是， 仅在声明时有有效。 pvc 一旦声明成功， 便无法在控制。
+ 最简单的例子， nfs 可以在声明限制 request 大小， 单实际使用，可以超过。

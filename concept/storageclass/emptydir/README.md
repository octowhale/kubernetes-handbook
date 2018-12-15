# EmptyDir

[emptyDir](https://kubernetes.io/docs/concepts/storage/volumes/#emptydir) 在 Pod 被分配到 Node 上后创建。
+ 可以挂载到同 Pod 下的多个 Container 中

> 注意: 由于 Pod 中 Container 共享网络， 因此 Container 监听同端口可能导致后起 Container 无法启动，例如 [启动两个 nginx 容器](dep-nginx-emptydir.yaml) 。


## task

> https://k8smeetup.github.io/docs/tasks/access-application-cluster/communicate-containers-same-pod-shared-volume/



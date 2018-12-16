# init-container

[`init container`](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/) 是一种特殊的容器调度。 

+ 就镜像和容器而言， 与应用容器并无差异。
+ **init container** 运行在 应用容器之前。
+ **init container** 一般用于
  + 初始化应用容器数据， 例如共享 volume
  + 依赖程序的 [health check](init-container.yaml) 。


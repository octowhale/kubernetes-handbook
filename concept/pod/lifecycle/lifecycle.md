# life-cycle

> https://kubernetes.io/docs/tasks/configure-pod-container/attach-handler-lifecycle-event/
> https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/

`life cycle` 为 **容器** 的生死提供了两种 hook 。

+ `postStart` : 在容器启动后 hook management 触发 hook。
  + `postStart` 和 `entrypoint` 是异步的（并行而非串行）。
  + `postStart` 执行时间过长 或 hang 住了， 容器不会被置为 running 状态。

+ `preStop` : 在容器退出前执行。

## Hook delivery guarantees

postStart 或 preStop 默认情况下只执行一次， 在特殊的环境 -- 比如 kubelet重启， 网络质量问题 -- 下，可能执行多次。
# probe

kubelet 通过 pod container 的 probe 返回值， 判断容器是否正常，并执行后续操作。

参考 [k8s task: probe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/#use-a-named-port)

[`probe` 配置参数](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/#configure-probes)

## liveness probe

liveness probe 通过三种方式判断 container/pod 状态是否正常。 如果判断为失败， 将根据 `restartPolicy` 重启 pod 。

+ exec

`livenessProbe.exec.command` 返回值为 0 , 则表示正常。 非 0 则表示异常，出发 `restartPolicy`

[**liveness-exec.yaml**](liveness-exec.yaml)

```yaml
spec:
  containers:
  - name: liveness
    image: k8s.gcr.io/busybox
    livenessProbe:
      exec:
        command:
        - cat
        - /tmp/healthy
      initialDelaySeconds: 5
      periodSeconds: 5
```

+ httpGet

有 kubelet 向 pod 发起 httpGet 请求, 如果返回值在 `200 <= StatusCode < 400` ，则表示正常。 反之，异常。

[**liveness-http.yaml**](liveness-http.yaml)

```yaml
spec:
  containers:
  - name: liveness
    image: k8s.gcr.io/liveness
    args:
    - /server
    livenessProbe:
      httpGet:
        path: /healthz
        port: 8080
        httpHeaders:
        - name: X-Custom-Header
          value: Awesome
      initialDelaySeconds: 3
      periodSeconds: 3
```



+ tcp

kubelet 主动向 pod 端口发起请求， 尝试建立 tcp 连接。 如果 tcp 通道失败，则表示异常。

liveness 与 readiness 的 tcp probe 类似。 

[**liveness-readiness-tcp.yaml**](liveness-readiness-tcp.yaml)

```yaml
spec:
  containers:
  - name: goproxy
    image: k8s.gcr.io/goproxy:0.1
    resources: {}
    ports:
    - containerPort: 8080
    livenessProbe:
      tcpSocket:
        port: 8080
      initialDelaySeconds: 15
      periodSeconds: 20
    readinessProbe:
      tcpSocket:
        port: 8080
      initialDelaySeconds: 5
      periodSeconds: 10
```


## readiness probe

与 `liveness probe` 不通， `readiness probe` 判断失败后，并不会强制重启 pod。 而是将 pod 状态置为 `NotReady`。

参数配置方式与 `liveness probe` 相似。

```yaml
# exec
readinessProbe:
  exec:
    command:
    - cat
    - /tmp/healthy
  initialDelaySeconds: 5
  periodSeconds: 5

# http
livenessProbe:
  httpGet:
    path: /healthz
    port: 8080
    httpHeaders:
    - name: X-Custom-Header
      value: Awesome
  initialDelaySeconds: 3
  periodSeconds: 3
```

## probe namd port

```yaml
# Use a named port
# You can use a named ContainerPort for HTTP or TCP liveness checks:

ports:
- name: liveness-port
  containerPort: 8080
  hostPort: 8080

livenessProbe:
  httpGet:
    path: /healthz
    port: liveness-port
```
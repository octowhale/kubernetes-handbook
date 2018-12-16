# pod 启动时使用参数

在编辑 pod template 的时候， `pod.spec.container[].command` 会覆盖容器的 `entrypoint`。

+ `command--sh-c` 是可以支持变量解析的。

```yaml
command:
  - sh
  - -c 
  - echo ${HOSTNAME}
```

+ `command--exec` 是不可用的。 因为 `exec` 是 `shell` 等的内置命令 `exec: shell built-in command` 。 在不载入 shell 之前是不能使用的。
  + 因此 ，可以在容器内部的 `/entrypoint.sh` shell 文件中使用。

```yaml
command:
  - exec
  - echo ${HOSTNAME}
```

+ `command-args` 是不支持变量解析的。 `${HOSTNAME}` 就是单纯的字符串。

```yaml
command:
- echo
args:
- Hello ${HOSTNAME}
```
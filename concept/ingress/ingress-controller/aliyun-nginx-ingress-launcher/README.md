# aliyun-nginx-ingress

> https://yq.aliyun.com/articles/645856?spm=5176.10695662.1996646101.searchclickresult.7e72341dji5G06


## nginx-controller

配置 `installer.sh` ， 并执行， 生成 yaml 配置文件。

+ aliyun 版本的 nginx-controller 通过 `slb -(tcp80/443)-> service` 到后端实现转发。
  + 因此， slb 性能可能是一个瓶颈。
+ 当 pod 被调度到 node 上时， slb 会自动关联后端的 node。
+ 多个 nginx-controller `不能` 使用相同的 `slb` ，否则会争抢 slb 转发规则。
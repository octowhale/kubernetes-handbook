```bash
# k create -f gluster-storage-class.yml

# kg storageclass
NAME                       PROVISIONER               AGE
alicloud-disk-available    alicloud/disk             8d
alicloud-disk-common       alicloud/disk             8d
alicloud-disk-efficiency   alicloud/disk             8d
alicloud-disk-ssd          alicloud/disk             8d
aliyun-gluster-slow        kubernetes.io/glusterfs   19s
# k create -f gluster-pvc.yml
persistentvolumeclaim "gluster1" created
# kg pvc
NAME       STATUS    VOLUME    CAPACITY   ACCESS MODES   STORAGECLASS          AGE
gluster1   Pending                                       aliyun-gluster-slow   6s
# kg pvc
NAME       STATUS    VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS          AGE
gluster1   Bound     pvc-9ef8f841-e821-11e8-bb2e-00163e0e3a75   1Gi        RWX            aliyun-gluster-slow   13s

# k create -f nginx-pod.yaml
pod "nginx-pod1" created
# kgp
NAME         READY     STATUS    RESTARTS   AGE
nginx-pod1   1/1       Running   0          3s
# kgp
NAME         READY     STATUS    RESTARTS   AGE
nginx-pod1   1/1       Running   0          6s



# kgp -o wide
NAME         READY     STATUS    RESTARTS   AGE       IP           NODE
nginx-pod1   1/1       Running   0          13s       10.2.2.149   cn-beijing.i-2zea5bxfhn20g4efq7e8
# keti nginx-pod1 sh
/ # mount |grep 172
172.16.4.61:vol_27bb595fe8b24cda00c6a2c7c1173bf8 on /usr/share/nginx/html type fuse.glusterfs (rw,relatime,user_id=0,group_id=0,default_permissions,allow_other,max_read=131072)
/ # cd /usr/share/nginx/html
/usr/share/nginx/html # echo 123123> index.html

/usr/share/nginx/html # echo "hello glusterfs" > index.html
/usr/share/nginx/html #
```
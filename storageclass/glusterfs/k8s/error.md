Name:               nginx-pod1
Namespace:          glusterfs
Priority:           0
PriorityClassName:  <none>
Node:               cn-beijing.i-2zea5bxfhn20g4efq7e9/172.16.4.58
Start Time:         Wed, 14 Nov 2018 17:17:58 +0800
Labels:             name=nginx-pod1
Annotations:        <none>
Status:             Pending
IP:
Containers:
  nginx-pod1:
    Container ID:
    Image:          nginx:latest
    Image ID:
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Waiting
      Reason:       ContainerCreating
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /usr/share/nginx/html from gluster-vol1 (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-p6d5w (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             False
  ContainersReady   False
  PodScheduled      True
Volumes:
  gluster-vol1:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  gluster1
    ReadOnly:   false
  default-token-p6d5w:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-p6d5w
    Optional:    false
QoS Class:       BestEffort
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute for 300s
                 node.kubernetes.io/unreachable:NoExecute for 300s
Events:
  Type     Reason       Age   From                                        Message
  ----     ------       ----  ----                                        -------
  Normal   Scheduled    1m    default-scheduler                           Successfully assigned glusterfs/nginx-pod1 to cn-beijing.i-2zea5bxfhn20g4efq7e9
  Warning  FailedMount  1m    kubelet, cn-beijing.i-2zea5bxfhn20g4efq7e9  MountVolume.SetUp failed for volume "pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75" : mount failed: mount failed: exit status 1
Mounting command: systemd-run
Mounting arguments: --description=Kubernetes transient mount for /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75 --scope -- mount -t glusterfs -o log-file=/var/lib/kubelet/plugins/kubernetes.io/glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75/nginx-pod1-glusterfs.log,backup-volfile-servers=172.16.4.61:172.16.4.62:172.16.4.63,auto_unmount,log-level=ERROR 172.16.4.61:vol_cf027054a7e65b89f2cd15daaa9952ce /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75
Output: Running scope as unit run-8964.scope.
[2018-11-14 09:17:58.517203] E [glusterfsd.c:795:gf_remember_backup_volfile_server] 0-glusterfs: failed to set volfile server: File exists
Mount failed. Please check the log file for more details.

 the following error information was pulled from the glusterfs log to help diagnose this issue:
[2018-11-14 09:17:58.525161] E [glusterfsd-mgmt.c:1890:mgmt_getspec_cbk] 0-glusterfs: failed to get the 'volume file' from server
[2018-11-14 09:17:58.525207] E [glusterfsd-mgmt.c:2067:mgmt_getspec_cbk] 0-mgmt: failed to fetch volume file (key:vol_cf027054a7e65b89f2cd15daaa9952ce)
  Warning  FailedMount  1m  kubelet, cn-beijing.i-2zea5bxfhn20g4efq7e9  MountVolume.SetUp failed for volume "pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75" : mount failed: mount failed: exit status 1
Mounting command: systemd-run
Mounting arguments: --description=Kubernetes transient mount for /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75 --scope -- mount -t glusterfs -o auto_unmount,log-level=ERROR,log-file=/var/lib/kubelet/plugins/kubernetes.io/glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75/nginx-pod1-glusterfs.log,backup-volfile-servers=172.16.4.61:172.16.4.62:172.16.4.63 172.16.4.61:vol_cf027054a7e65b89f2cd15daaa9952ce /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75
Output: Running scope as unit run-9083.scope.
[2018-11-14 09:17:59.135612] E [glusterfsd.c:795:gf_remember_backup_volfile_server] 0-glusterfs: failed to set volfile server: File exists
Mount failed. Please check the log file for more details.

 the following error information was pulled from the glusterfs log to help diagnose this issue:
[2018-11-14 09:17:59.143301] E [glusterfsd-mgmt.c:1890:mgmt_getspec_cbk] 0-glusterfs: failed to get the 'volume file' from server
[2018-11-14 09:17:59.143342] E [glusterfsd-mgmt.c:2067:mgmt_getspec_cbk] 0-mgmt: failed to fetch volume file (key:vol_cf027054a7e65b89f2cd15daaa9952ce)
  Warning  FailedMount  1m  kubelet, cn-beijing.i-2zea5bxfhn20g4efq7e9  MountVolume.SetUp failed for volume "pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75" : mount failed: mount failed: exit status 1
Mounting command: systemd-run
Mounting arguments: --description=Kubernetes transient mount for /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75 --scope -- mount -t glusterfs -o auto_unmount,log-level=ERROR,log-file=/var/lib/kubelet/plugins/kubernetes.io/glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75/nginx-pod1-glusterfs.log,backup-volfile-servers=172.16.4.61:172.16.4.62:172.16.4.63 172.16.4.61:vol_cf027054a7e65b89f2cd15daaa9952ce /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75
Output: Running scope as unit run-9208.scope.
[2018-11-14 09:18:00.245060] E [glusterfsd.c:795:gf_remember_backup_volfile_server] 0-glusterfs: failed to set volfile server: File exists
Mount failed. Please check the log file for more details.

 the following error information was pulled from the glusterfs log to help diagnose this issue:
[2018-11-14 09:18:00.252762] E [glusterfsd-mgmt.c:1890:mgmt_getspec_cbk] 0-glusterfs: failed to get the 'volume file' from server
[2018-11-14 09:18:00.252819] E [glusterfsd-mgmt.c:2067:mgmt_getspec_cbk] 0-mgmt: failed to fetch volume file (key:vol_cf027054a7e65b89f2cd15daaa9952ce)
  Warning  FailedMount  1m  kubelet, cn-beijing.i-2zea5bxfhn20g4efq7e9  MountVolume.SetUp failed for volume "pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75" : mount failed: mount failed: exit status 1
Mounting command: systemd-run
Mounting arguments: --description=Kubernetes transient mount for /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75 --scope -- mount -t glusterfs -o auto_unmount,log-level=ERROR,log-file=/var/lib/kubelet/plugins/kubernetes.io/glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75/nginx-pod1-glusterfs.log,backup-volfile-servers=172.16.4.61:172.16.4.62:172.16.4.63 172.16.4.61:vol_cf027054a7e65b89f2cd15daaa9952ce /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75
Output: Running scope as unit run-9327.scope.
[2018-11-14 09:18:02.446916] E [glusterfsd.c:795:gf_remember_backup_volfile_server] 0-glusterfs: failed to set volfile server: File exists
Mount failed. Please check the log file for more details.

 the following error information was pulled from the glusterfs log to help diagnose this issue:
[2018-11-14 09:18:02.454825] E [glusterfsd-mgmt.c:1890:mgmt_getspec_cbk] 0-glusterfs: failed to get the 'volume file' from server
[2018-11-14 09:18:02.454869] E [glusterfsd-mgmt.c:2067:mgmt_getspec_cbk] 0-mgmt: failed to fetch volume file (key:vol_cf027054a7e65b89f2cd15daaa9952ce)
  Warning  FailedMount  1m  kubelet, cn-beijing.i-2zea5bxfhn20g4efq7e9  MountVolume.SetUp failed for volume "pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75" : mount failed: mount failed: exit status 1
Mounting command: systemd-run
Mounting arguments: --description=Kubernetes transient mount for /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75 --scope -- mount -t glusterfs -o auto_unmount,log-level=ERROR,log-file=/var/lib/kubelet/plugins/kubernetes.io/glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75/nginx-pod1-glusterfs.log,backup-volfile-servers=172.16.4.61:172.16.4.62:172.16.4.63 172.16.4.61:vol_cf027054a7e65b89f2cd15daaa9952ce /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75
Output: Running scope as unit run-9442.scope.
[2018-11-14 09:18:06.656834] E [glusterfsd.c:795:gf_remember_backup_volfile_server] 0-glusterfs: failed to set volfile server: File exists
Mount failed. Please check the log file for more details.

 the following error information was pulled from the glusterfs log to help diagnose this issue:
[2018-11-14 09:18:06.664692] E [glusterfsd-mgmt.c:1890:mgmt_getspec_cbk] 0-glusterfs: failed to get the 'volume file' from server
[2018-11-14 09:18:06.664737] E [glusterfsd-mgmt.c:2067:mgmt_getspec_cbk] 0-mgmt: failed to fetch volume file (key:vol_cf027054a7e65b89f2cd15daaa9952ce)
  Warning  FailedMount  1m  kubelet, cn-beijing.i-2zea5bxfhn20g4efq7e9  MountVolume.SetUp failed for volume "pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75" : mount failed: mount failed: exit status 1
Mounting command: systemd-run
Mounting arguments: --description=Kubernetes transient mount for /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75 --scope -- mount -t glusterfs -o backup-volfile-servers=172.16.4.61:172.16.4.62:172.16.4.63,auto_unmount,log-level=ERROR,log-file=/var/lib/kubelet/plugins/kubernetes.io/glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75/nginx-pod1-glusterfs.log 172.16.4.61:vol_cf027054a7e65b89f2cd15daaa9952ce /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75
Output: Running scope as unit run-9574.scope.
[2018-11-14 09:18:14.848472] E [glusterfsd.c:795:gf_remember_backup_volfile_server] 0-glusterfs: failed to set volfile server: File exists
Mount failed. Please check the log file for more details.

 the following error information was pulled from the glusterfs log to help diagnose this issue:
[2018-11-14 09:18:14.857133] E [glusterfsd-mgmt.c:1890:mgmt_getspec_cbk] 0-glusterfs: failed to get the 'volume file' from server
[2018-11-14 09:18:14.857182] E [glusterfsd-mgmt.c:2067:mgmt_getspec_cbk] 0-mgmt: failed to fetch volume file (key:vol_cf027054a7e65b89f2cd15daaa9952ce)
  Warning  FailedMount  1m  kubelet, cn-beijing.i-2zea5bxfhn20g4efq7e9  MountVolume.SetUp failed for volume "pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75" : mount failed: mount failed: exit status 1
Mounting command: systemd-run
Mounting arguments: --description=Kubernetes transient mount for /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75 --scope -- mount -t glusterfs -o auto_unmount,log-level=ERROR,log-file=/var/lib/kubelet/plugins/kubernetes.io/glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75/nginx-pod1-glusterfs.log,backup-volfile-servers=172.16.4.61:172.16.4.62:172.16.4.63 172.16.4.61:vol_cf027054a7e65b89f2cd15daaa9952ce /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75
Output: Running scope as unit run-9691.scope.
[2018-11-14 09:18:31.047257] E [glusterfsd.c:795:gf_remember_backup_volfile_server] 0-glusterfs: failed to set volfile server: File exists
Mount failed. Please check the log file for more details.

 the following error information was pulled from the glusterfs log to help diagnose this issue:
[2018-11-14 09:18:31.055105] E [glusterfsd-mgmt.c:1890:mgmt_getspec_cbk] 0-glusterfs: failed to get the 'volume file' from server
[2018-11-14 09:18:31.055151] E [glusterfsd-mgmt.c:2067:mgmt_getspec_cbk] 0-mgmt: failed to fetch volume file (key:vol_cf027054a7e65b89f2cd15daaa9952ce)
  Warning  FailedMount  54s  kubelet, cn-beijing.i-2zea5bxfhn20g4efq7e9  MountVolume.SetUp failed for volume "pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75" : mount failed: mount failed: exit status 1
Mounting command: systemd-run
Mounting arguments: --description=Kubernetes transient mount for /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75 --scope -- mount -t glusterfs -o auto_unmount,log-level=ERROR,log-file=/var/lib/kubelet/plugins/kubernetes.io/glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75/nginx-pod1-glusterfs.log,backup-volfile-servers=172.16.4.61:172.16.4.62:172.16.4.63 172.16.4.61:vol_cf027054a7e65b89f2cd15daaa9952ce /var/lib/kubelet/pods/2d379f40-e7ee-11e8-962e-00163e124dc7/volumes/kubernetes.io~glusterfs/pvc-d53c10b2-e7ed-11e8-bb2e-00163e0e3a75
Output: Running scope as unit run-9893.scope.
[2018-11-14 09:19:03.246895] E [glusterfsd.c:795:gf_remember_backup_volfile_server] 0-glusterfs: failed to set volfile server: File exists
Mount failed. Please check the log file for more details.

 the following error information was pulled from the glusterfs log to help diagnose this issue:
[2018-11-14 09:19:03.254829] E [glusterfsd-mgmt.c:1890:mgmt_getspec_cbk] 0-glusterfs: failed to get the 'volume file' from server
[2018-11-14 09:19:03.254874] E [glusterfsd-mgmt.c:2067:mgmt_getspec_cbk] 0-mgmt: failed to fetch volume file (key:vol_cf027054a7e65b89f2cd15daaa9952ce)
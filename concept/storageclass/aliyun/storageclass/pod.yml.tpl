apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod-${no}
  labels:
    name: nginx-pod-${no}
spec:
  containers:
    - name: nginx-pod-${no}
      image: uyinn28/alpine-tool
      ports:
        - name: web
          containerPort: 80
      volumeMounts:
        - name: gluster-vol-${no}
          mountPath: /usr/share/nginx/html
      resources:
        limits:
          cpu: 100m
          memory: 100Mi
        requests:
          cpu: 100m
          memory: 100Mi
  nodeSelector:
    disk: efficiency
        
  volumes:
    - name: gluster-vol-${no}
      persistentVolumeClaim:
        claimName: alicloud-disk-efficiency-test-pvc-${no}

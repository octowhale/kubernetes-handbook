kind: Pod
apiVersion: v1
metadata:
  name: test-pod-2
spec:
  containers:
  - name: test-pod
    # image: gcr.io/google_containers/busybox:1.24
    image: uyinn28/alpine-tool
    resources:
      limits:
        cpu: 100m
        memory: 100Mi
    lifecycle:
      postStart:
        exec:
          command:
            - sh
            - -c
            - echo hello > /usr/share/nginx/html/index.html
    volumeMounts:
      - name: nfs-pvc
        mountPath: "/usr/share/nginx/html/"
  restartPolicy: "Never"
  volumes:
    - name: nfs-pvc
      persistentVolumeClaim:
        claimName: ${PVC_NAME}

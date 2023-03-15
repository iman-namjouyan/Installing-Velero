# Velero
**Install velero:**
```
1- download velero cli from https://github.com/vmware-tanzu/velero/releases/download/v1.10.2/velero-v1.10.2-linux-amd64.tar.gz
2- cd /opt
2- tar xzfv velero-v1.10.2-linux-amd64.tar.gz
3- cd velero-v1.10.2-linux-amd64
4- cp veleo /usr/bin
5- velero version
```
![image](https://user-images.githubusercontent.com/16554389/225233147-e34c2974-f884-45fd-b023-38a48e70cc82.png)

Install velero (Base: Minio/Ceph):
1- Create bucket on minio or ceph.
2- Create accesskey and secretkey for access to bucket.
3- install velero server:
```
velero install --provider aws --bucket velero --secret-file ./minio.credentials --backup-location-config region=minio,s3ForcePathStyle=true,s3Url=http://10.0.85.219:9000 --plugins velero/velero-plugin-for-aws:v1.2.1
```

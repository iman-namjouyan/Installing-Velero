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

**Note: This sample In the example below, velero server is configured based on Minio.**

```
velero install --provider aws \
--bucket velero \
--secret-file ./minio.credentials \
--backup-location-config region=minio,s3ForcePathStyle=true,s3Url=http://<Minio Server IP Address>:9000 \
--plugins velero/velero-plugin-for-aws:v1.2.1

```
![image](https://user-images.githubusercontent.com/16554389/225235494-9c4b2fa3-843d-4787-be80-b5549c9a3d8f.png)

#----------------------------------------- Velero useful commands
```
velero backup get #show list backups
velero backup logs <Backup Name>     #show log for specific backup
velero backup download <backup Name> #download specific backup as "tar.gz" file.
velero backup describe <Backup Name> #show specific backup status
velero backup delete <Backup Name>   #delete specific backup
velero backup create <Backup Name>   #cretae backup
velero backup create backup1 --include-namespaces=develop #create backup resources just from 
```
#----------------------------------------- Create Simple Backup

**Create simple backup from "develop" namespace:**
- velero backup create backup1 --include-namespaces=develop
- velero backup describe backup1 #Check backup status

![image](https://user-images.githubusercontent.com/16554389/225237414-b51b3bf2-66a8-4df7-a3f7-a38f5ffb1235.png)

- Note: "velero backup logs backup1", Shows the backup log


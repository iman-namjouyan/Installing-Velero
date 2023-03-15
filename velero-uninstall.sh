#!/bin/bash
#-------------------------------------#
# This script uninstall velero server #
#-------------------------------------#
kubectl delete namespace/velero clusterrolebinding/velero
sleep 3
kubectl delete crds -l component=velero

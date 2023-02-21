#!/bin/bash

# 卸载监控对象
NAMESPACE="redis"

# Uninstall Redis deployments
#for RELEASE in $(helm list -n $NAMESPACE --short)
#do
#  echo "Uninstalling $RELEASE ..."
#  helm uninstall -n $NAMESPACE $RELEASE
#done

helm ls --namespace $NAMESPACE | grep redis | awk '{print $1}' | xargs -I {} helm delete --purge {}
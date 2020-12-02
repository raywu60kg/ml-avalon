# ml-avalon
create by 
```
helm create avalon
```

## requirement
- minikube
- helm

## contain
- kafka: https://github.com/confluentinc/cp-helm-charts
- data-lake
  - minIO: https://github.com/minio/charts
  - arrow
  - cassandra
- feature store
  - kubeflow(kfctl_v1.0-0-g94c35cf_linux.tar.gz)
- BI
  - metabase
- Apache Beam
- Flink

## Reference
https://www.featurestore.org
https://github.com/confluentinc/cp-helm-charts
https://github.com/minio/charts
https://www.kubeflow.org/docs/started/workstation/minikube-linux/
https://minikube.sigs.k8s.io/docs/
https://kubernetes.io/docs/reference/kubectl/cheatsheet/


# kubeflow
strong tools for pipeline
## Installation

## dashboard remote
```
kubectl proxy --address='0.0.0.0' --disable-filter=true
```
then go to
```
http://<your_api_server_ip>:8001/api/v1/namespaces/kubeflow/services/http:centraldashboard:/proxy/
```

## Reference
https://www.kubeflow.org/docs/started/k8s/kfctl-k8s-istio/

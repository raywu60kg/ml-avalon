cassandra-up:
	helm install cassandra --set db.user=arthur,dbUser.password=arthur bitnami/cassandra
cassandra-down:
	helm uninstall cassandra
kafka-up:
	helm install kafka bitnami/kafka
kafka-down:
	helm uninstall kafka
spark-up:
	helm install spark bitnami/spark
spark-down:
	helm uninstall spark
minikube-up:
	minikube start --cpus 6 --memory 12288 --disk-size=120g --extra-config=apiserver.service-account-issuer=api --extra-config=apiserver.service-account-signing-key-file=/var/lib/minikube/certs/apiserver.key --extra-config=apiserver.service-account-api-audiences=api --kubernetes-version=v1.14.10

kubeflow-up:
	kfctl apply -V -f kubeflow/kfctl_k8s_istio.v1.0.2.yaml
kubeflow-down:
	kfctl delete -f kubeflow/kfctl_k8s_istio.v1.0.2.yaml

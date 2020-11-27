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
lenses-up:
	helm install lenses lensesio/lenses --set restPort=9991
lenses-down:
	helm uninstall lenses

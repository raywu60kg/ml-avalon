NAME: pipeline
LAST DEPLOYED: Fri Nov 27 10:31:22 2020
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
** Please be patient while the chart is being deployed **

Cassandra can be accessed through the following URLs from within the cluster:

  - CQL: pipeline-cassandra.default.svc.cluster.local:9042
  - Thrift: pipeline-cassandra.default.svc.cluster.local:9160

To get your password run:

   export CASSANDRA_PASSWORD=$(kubectl get secret --namespace default pipeline-cassandra -o jsonpath="{.data.cassandra-password}" | base64 --decode)

Check the cluster status by running:

   kubectl exec -it --namespace default $(kubectl get pods --namespace default -l app=cassandra,release=pipeline -o jsonpath='{.items[0].metadata.name}') nodetool status

To connect to your Cassandra cluster using CQL:

1. Run a Cassandra pod that you can use as a client:

   kubectl run --namespace default pipeline-cassandra-client --rm --tty -i --restart='Never' \
   --env CASSANDRA_PASSWORD=$CASSANDRA_PASSWORD \
    \
   --image docker.io/bitnami/cassandra:3.11.9-debian-10-r0 -- bash

2. Connect using the cqlsh client:

   cqlsh -u cassandra -p $CASSANDRA_PASSWORD pipeline-cassandra

To connect to your database from outside the cluster execute the following commands:

   kubectl port-forward --namespace default svc/pipeline-cassandra 9042:9042 &
   cqlsh -u cassandra -p $CASSANDRA_PASSWORD 127.0.0.1 9042


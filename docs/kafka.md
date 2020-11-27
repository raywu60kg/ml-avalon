NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
** Please be patient while the chart is being deployed **

Kafka can be accessed by consumers via port 9092 on the following DNS name from within your cluster:

    kafka.default.svc.cluster.local

Each Kafka broker can be accessed by producers via port 9092 on the following DNS name(s) from within your cluster:

    kafka-0.kafka-headless.default.svc.cluster.local:9092

To create a pod that you can use as a Kafka client run the following commands:

    kubectl run kafka-client --restart='Never' --image docker.io/bitnami/kafka:2.6.0-debian-10-r78 --namespace default --command -- sleep infinity
    kubectl exec --tty -i kafka-client --namespace default -- bash

    PRODUCER:
        kafka-console-producer.sh \
            
            --broker-list kafka-0.kafka-headless.default.svc.cluster.local:9092 \
            --topic test

    CONSUMER:
        kafka-console-consumer.sh \
            
            --bootstrap-server kafka.default.svc.cluster.local:9092 \
            --topic test \
            --from-beginning


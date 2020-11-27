NOTES:
1. Get the Spark master WebUI URL by running these commands:

  kubectl port-forward --namespace default svc/spark-master-svc 80:80
  echo "Visit http://127.0.0.1:80 to use your application"

2. Submit an application to the cluster:

  To submit an application to the cluster the spark-submit script must be used. That script can be
  obtained at https://github.com/apache/spark/tree/master/bin. Also you can use kubectl run.

  export EXAMPLE_JAR=$(kubectl exec -ti --namespace default spark-worker-0 -- find examples/jars/ -name 'spark-example*\.jar' | tr -d '\r')

  kubectl exec -ti --namespace default spark-worker-0 -- spark-submit --master spark://spark-master-svc:7077 \
    --class org.apache.spark.examples.SparkPi \
    $EXAMPLE_JAR 5


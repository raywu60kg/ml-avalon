import os
from pyspark.sql import SparkSession

# create spark session
spark = SparkSession \
    .builder \
    .appName("Python Spark SQL basic example") \
    .config("spark.some.config.option", "some-value") \
    .getOrCreate()

# subscribe kafka
val df = spark
  .readStream
  .format("kafka")
  .option("kafka.bootstrap.servers", "host1:port1,host2:port2")
  .option("subscribe", "topic1")
  .load()
df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)")
  .as[(String, String)]

# write to cassandra
df.writeStream\
    .format("console")\
    .start()
df.writeStream\
    .format("org.apache.spark.sql.cassandra") \
    .mode("append")\
    .optons(table="table_name", keyspace="keyspace_name")
    .start()

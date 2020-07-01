# 大数据开发本地Docker开发环境
# 包含组件
- Flink Standalone 1.11
- Kafka 2.4.1
- [Kafka monitor eagle](https://www.kafka-eagle.org/)
- Kafka Connect
- Debezium 1.2
- Confluent Schema Registry
- Canal 1.1.4
- MySQL 5.7
- [Hive 2.3.2](https://github.com/big-data-europe/docker-hive)
- Hive metastore
- Prometheus
- Grafana
- 数据Producer (WMS, RMS, Robot)
# 调研组件
- ClickHouse
# 使用方法
## 进入hive cmd
```
docker-compose exec hiver-server bash
/opt/hive/bin/beeline -u jdbc:hive2://localhost:10000
> CREATE TABLE pokes (foo INT, bar STRING);
> LOAD DATA LOCAL INPATH '/opt/hive/examples/files/kv1.txt' OVERWRITE INTO TABLE pokes;
```




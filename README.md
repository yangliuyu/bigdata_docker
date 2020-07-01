# 大数据开发本地Docker开发环境
# 包含组件
- Flink Standalone 1.11
- Kafka 2.4.1
- [Kafka monitor eagle](https://www.kafka-eagle.org/)
- Kafka Connect
- [Debezium 1.2](https://debezium.io/documentation/reference/1.2/tutorial.html)
- Confluent Schema Registry
- Canal 1.1.4
- MySQL 5.7.30
- [Hive 2.3.2](https://github.com/big-data-europe/docker-hive)
- Hive metastore
- Prometheus
- Grafana
- 数据Producer (WMS, RMS, Robot)
# 调研组件
- ClickHouse
# 使用方法
## [hive](https://github.com/big-data-europe/docker-hive)
```
docker-compose exec hive-server bash
/opt/hive/bin/beeline -u jdbc:hive2://localhost:10000
> CREATE TABLE pokes (foo INT, bar STRING);
> LOAD DATA LOCAL INPATH '/opt/hive/examples/files/kv1.txt' OVERWRITE INTO TABLE pokes;
```
## [debezium](https://github.com/debezium/debezium-examples/tree/master/tutorial)
```
Start MySQL connector
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @debezium/register-mysql.json

# Consume messages from a Debezium topic
docker-compose -f docker-compose-mysql.yaml exec kafka /opt/kafka/bin/kafka-console-consumer.sh \
    --bootstrap-server kafka:9092 \
    --from-beginning \
    --property print.key=true \
    --topic dbserver1.inventory.customers

# Modify records in the database via MySQL client
docker-compose exec mysql bash -c 'mysql -u $MYSQL_USER -p$MYSQL_PASSWORD inventory'
UPDATE customers SET first_name='Anne Marie' WHERE id=1004;
```
## Kafka
```
docker-compose exec kafka kafka-console-consumer.sh --bootstrap-server kafka:9092 --from-beginning --topic orders
docker-compose exec kafka kafka-console-consumer.sh --bootstrap-server kafka:9092 --from-beginning --topic lineitem
docker-compose exec kafka kafka-console-consumer.sh --bootstrap-server kafka:9092 --from-beginning --topic rates
```
## Flink SQL Client
```
docker-compose exec flink-sql-client ./sql-client.sh
SHOW TABLES;
DESCRIBE prod_orders;
SELECT * FROM prod_orders;
use catalog hive;
show tables;
DESCRIBE prod_nation;
SELECT * FROM prod_nation;
```

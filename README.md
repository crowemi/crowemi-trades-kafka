
### Zookeeper:

`docker run -network host --name zookeeper -it kafka-base`

`sh zookeeper-server-start.sh /kafka/config/zookeeper.properties`

### Kafka:

`docker run -network host --name kafka -it kafka-base`

`sh /kafka/bin/kafka-server-start.sh /kafka/config/server.properties`
FROM ubuntu:22.04

RUN apt update && \
    apt install --no-install-recommends -y -q curl default-jdk nano systemctl
# zookeeperd

# Expose Kafka/Zookeeper ports
EXPOSE 9092
EXPOSE 2181

# Set environment variables
ENV KAFKA_VERSION=3.5.0
ENV SCALA_VERSION=2.13

RUN mkdir /downloads && \
    cd /downloads && \
    curl "https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" -o /downloads/kafka.tgz

RUN mkdir /kafka
RUN cd /kafka && tar -xvzf /downloads/kafka.tgz --strip 1
RUN rm -r /downloads

COPY ./services/zookeeper.service /etc/systemd/system/
COPY ./services/kafka.service /etc/systemd/system/

ENTRYPOINT [ "sh" ] 
# CMD [ "/kafka/bin/kafka-server-start.sh", "/kafka/config/server.properties" ]

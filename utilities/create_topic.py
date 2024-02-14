from confluent_kafka.admin import AdminClient, NewTopic


admin_client = AdminClient({
    "bootstrap.servers": "10.5.0.6:9092"
})

topic_list = []
topic_list.append(NewTopic("example_topic", 1, 1))
topics = admin_client.list_topics()
print(topics)
from kafka import KafkaConsumer
import json

consumer = KafkaConsumer(
    'events',
    bootstrap_servers=['localhost:19092', 'localhost:19093'],
    value_deserializer=lambda v: json.loads(v.decode('utf-8')),
    group_id='event-consumers',
    auto_offset_reset='earliest'
)

for message in consumer:
    print(f"Received: {message.value}")

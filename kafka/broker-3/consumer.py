from kafka import KafkaConsumer
import json

consumer = KafkaConsumer(
    'events',
    bootstrap_servers=['10.0.1.10:9093', '10.0.1.20:9093', '10.0.1.30:9093'],
    value_deserializer=lambda v: json.loads(v.decode('utf-8')),
    group_id='event-consumers',
    auto_offset_reset='earliest'
)

for message in consumer:
    print(f"Received: {message.value}")

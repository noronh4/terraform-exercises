from kafka import KafkaProducer
import logging
import json

logging.basicConfig(level=logging.DEBUG)

producer = KafkaProducer(
    bootstrap_servers=['10.0.1.10:9093', '10.0.1.20:9093', '10.0.1.30:9093'],
    value_serializer=lambda v: json.dumps(v).encode('utf-8')
)

print("Producer created successfully.")
metadata = producer.partitions_for('events')
print(f"Partitions for topic 'events': {metadata}")

topic = 'events'
for i in range(10):
    event = {'event_id': i, 'message': f'Message {i}'}
    producer.send(topic, value=event)
    print(f'Sent: {event}')
producer.close()

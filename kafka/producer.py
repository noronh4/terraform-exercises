from kafka import KafkaProducer
import logging
import json

logging.basicConfig(level=logging.DEBUG)

producer = KafkaProducer(
    bootstrap_servers=['localhost:9092', 'localhost:9192', 'localhost:9292'],
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

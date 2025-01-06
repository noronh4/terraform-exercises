from kafka import KafkaProducer
import json
import time

producer = KafkaProducer(
    bootstrap_servers=['localhost:19092', 'localhost:19093'],
    value_serializer=lambda v: json.dumps(v).encode('utf-8')
)

topic = 'events'

for i in range(100):
    event = {'event_id': i, 'message': f'Message {i}'}
    producer.send(topic, value=event)
    print(f'Sent: {event}')
    time.sleep(1)

producer.close()

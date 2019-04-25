require "kafka"

# Start a broker locally
# Create "votes" kafka topic
$kafka = Kafka.new(APP_CONFIG['KAFKA_BORKERS'], logger: Rails.logger)


# We don't aysnc produce here
$kafka_producer = $kafka.producer(
  # Waiting for acknowledgment is meeting our need
  # It's enough to wait for the leader partition (no need to wait for the replicas )
  required_acks: 1
  # Also no need to compress the json so far
)
#
#
at_exit { $kafka_producer.shutdown }

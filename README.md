# README

This is a simple hands-on app with Rails and Kafka. It's an election app to collect votes and publish them to KAFKA using the producer API.

To get the app up and run you have to:

* Download Kafka from https://kafka.apache.org/downloads

* Unzip the source and cd to the KAFKA directory

* Run Zookeeper server "bin/zookeeper-server-start.sh config/zookeeper.properties"

* Run at least one KAFKA broker "bin/kafka-server-start.sh config/server.properties"

* Create KAFKA "votes" topic "bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic votes"

* Pull the repo

* Bundle install

* Rail s

* To test your work. Use the consumer API to make sure everything is working well.

* Have a good democratic day!

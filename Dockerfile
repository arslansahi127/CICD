# Base image
FROM docker.elastic.co/elasticsearch/elasticsearch:7.16.2

# Set environment variables
ENV node.name elasticsearch
ENV network.host 0.0.0.0
ENV discovery.type single-node
ENV ELASTICSEARCH_PASSWORD elastic
ENV ES_JAVA_OPTS "-Xms512m -Xmx512m"
ENV xpack.security.enabled false

# Expose port
EXPOSE 9200

# Start Elasticsearch
CMD ["bin/elasticsearch"]

# Base image
FROM docker.elastic.co/kibana/kibana:7.16.2

# Set environment variables
ENV server.name kibana
ENV server.host 0.0.0.0
ENV ELASTICSEARCH_HOSTS "http://elasticsearch:9200"
ENV ELASTICSEARCH_USERNAME elastic
ENV ELASTICSEARCH_PASSWORD elastic
ENV monitoring.ui.container.elasticsearch.enabled true

# Expose port
EXPOSE 5601

# Start Kibana
CMD ["bin/kibana"]

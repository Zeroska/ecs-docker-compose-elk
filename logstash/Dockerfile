# https://www.docker.elastic.co/
FROM docker.elastic.co/logstash/logstash:8.0.1
ENV LOGSTASH_PASSWORD elastic
ENV LOGSTASH_USER logstash_system
ENV ELASTIC_HOST https://master:9200

# Delete existed config 
RUN rm -f /usr/share/logstash/pipeline/logstash.conf

# Add new config
COPY ./config/logstash.yml config/logstash.yml
COPY ./pipeline/logstash.conf pipeline/logstash.conf

# Set ownership
USER root
RUN chown -R 1000:0 config/logstash.yml config/pipelines.yml

# Install plugin right here
RUN bin/logstash-plugin install logstash-filter-multiline 
USER logstash

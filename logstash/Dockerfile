ARG STACK_VERSION

# https://www.docker.elastic.co/
FROM docker.elastic.co/logstash/logstash:${STACK_VERSION}
WORKDIR /usr/share

COPY ./config/logstash.yml logstash/config/logstash.yml
COPY ./pipeline/logstash.conf logstash/pipeline/logstash.conf

# The Cert 

# Install plugin right here
RUN logstash-plugin install logstash-filter-multiline 

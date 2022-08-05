# https://www.docker.elastic.co/
FROM docker.elastic.co/kibana/kibana:8.0.1

# Remember to set ENV for the ELASTICSEARCH HOSTS
ENV ELASTICSEARCH_HOSTS 0.0.0.0
ENV KIBANA_PASSWORD  elastic
COPY ./config/kibana.yml /usr/share/kibana/
USER root
RUN chown -R 1000:0 config/kibana.yml
USER kibana

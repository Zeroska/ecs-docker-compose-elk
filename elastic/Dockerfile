ARG STACK_VERSION

FROM docker.elastic.co/elastic/elasticsearch:${STACK_VERSION}
WORKDIR /usr/share/

COPY ./config/elasticsearch.yml elasticsearch/config/elasticsearch.yml
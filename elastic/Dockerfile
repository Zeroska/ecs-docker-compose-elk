FROM docker.elastic.co/elasticsearch/elasticsearch:8.0.1
# ENV for the AWS ECS environment varibles
ENV REGION ap-southeast-1
ENV NODE_NAME master
ENV HOST_E1 master
ENV HOST_E2 master1
ENV HOST_E3 master2
ENV ROLE master
ENV DATA_NAME data
ENV KIBANA_PASSWORD changme
ENV ELASTIC_PASSWORD elastic
COPY config/elasticsearch.yml /usr/share/elasticsearch/config/
COPY config/unicast_hosts.txt /usr/share/elasticsearch/config/
USER root
RUN chown 1000:0 config/elasticsearch.yml
# Install plugins
RUN bin/elasticsearch-plugin install -b discovery-ec2 && bin/elasticsearch-plugin install -b repository-s3
# Setup SSL Certificate
RUN mkdir -p config/certs
RUN if [ ! -f config/certs/ca.zip ]; then \
    echo "Creating CA"; \
    # Go to Elasitsearch node generate the cert for other node by using certutils
    bin/elasticsearch-certutil ca --silent --pem -out config/certs/ca.zip; \
    unzip config/certs/ca.zip -d config/certs; \
    fi; \
    if [ ! -f config/certs/certs.zip ]; then \
    echo "Creating certs";      \
    echo -ne \ 
    "instances:\n"\
    "  - name: ${HOST_E1}\n"\
    "    dns:\n"\
    "      - internal-alb-elk-elasticsearch-01-211939396.ap-southeast-1.elb.amazonaws.com\n"\ 
    "  - name: ${HOST_E2}\n"\
    "    dns:\n"\
    "      - internal-alb-elk-elasticsearch-01-211939396.ap-southeast-1.elb.amazonaws.com\n"\
    "  - name: ${HOST_E3}\n"\
    "    dns:\n"\
    "      - internal-alb-elk-elasticsearch-01-211939396.ap-southeast-1.elb.amazonaws.com\n"\
    "  - name: kibana\n"\
    "    dns:\n"\
    "      - kibana\n"\
    "    ip:\n"\
    "      - 100.73.0.41\n"\
    "  - name: logstash\n"\
    "    dns:\n"\
    "      - logstash\n"\
    "    ip:\n"\
    "      - 100.73.0.38\n"\
    > config/certs/instances.yml; \
    bin/elasticsearch-certutil cert --silent --pem -out config/certs/certs.zip --in config/certs/instances.yml --ca-cert config/certs/ca/ca.crt --ca-key config/certs/ca/ca.key; \
    unzip config/certs/certs.zip -d config/certs; \
    fi; \
    echo "Setting file permissions" \
    chown -R 1000:0 config/certs; \
    find . -type d -exec chmod 777 \{\} \;; \
    find . -type f -exec chmod 777 \{\} \;; 

USER elasticsearch

if [ ! -f config/certs/ca.zip ]; then
echo "Creating CA";
# Go to Elasitsearch node generate the cert for other node by using certutils
bin/elasticsearch-certutil ca --silent --pem -out config/certs/ca.zip;
unzip config/certs/ca.zip -d config/certs;
fi;
if [ ! -f config/certs/certs.zip ]; then
echo "Creating certs";      
# TODO: Should change the host, name, ip later
echo -ne \
       "instances:\n"\
       "  - name: es01\n"\
       "    dns:\n"\
       "      - es01\n"\
       "      - localhost\n"\ # 172.17.0.2
       "    ip:\n"\
       "      - 127.0.0.1\n"\ # 172.17.0.2
       "  - name: es02\n"\
       "    dns:\n"\
       "      - es02\n"\
       "      - localhost\n"\ # 172.17.0.3
       "    ip:\n"\
       "      - 127.0.0.1\n"\  # 172.17.0.3
       "  - name: es03\n"\
       "    dns:\n"\
       "      - es03\n"\
       "      - localhost\n"\ # 172.17.0.4       
       "    ip:\n"\
       "      - 127.0.0.1\n"\ # 172.17.0.4
       "  - name: logstash\n"\
       "    dns:\n"\
       "      - logstash\n"\
       "      - localhost\n"\
       "    ip:\n"\
       "      - 127.0.0.1\n"\ #  Must be IP address of the logstash intance
       > config/certs/instances.yml;
bin/elasticsearch-certutil cert --silent --pem -out config/certs/certs.zip --in config/certs/instances.yml --ca-cert config/certs/ca/ca.crt --ca-key config/certs/ca/ca.key;
unzip config/certs/certs.zip -d config/certs;
fi;




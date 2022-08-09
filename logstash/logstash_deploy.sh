docker build -t logstash .
docker tag logstash:latest 261093894796.dkr.ecr.ap-southeast-1.amazonaws.com/logstash:latest
docker push 261093894796.dkr.ecr.ap-southeast-1.amazonaws.com/logstash:latest   
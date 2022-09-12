aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 261093894796.dkr.ecr.ap-southeast-1.amazonaws.com 
docker build -t logstash .
docker tag logstash:latest 261093894796.dkr.ecr.ap-southeast-1.amazonaws.com/logstash:latest
docker push 261093894796.dkr.ecr.ap-southeast-1.amazonaws.com/logstash:latest

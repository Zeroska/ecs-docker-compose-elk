docker build -t elasticsearch .
docker tag elasticsearch:latest 261093894796.dkr.ecr.ap-southeast-1.amazonaws.com/elasticsearch:latest
docker push 261093894796.dkr.ecr.ap-southeast-1.amazonaws.com/elasticsearch:latest
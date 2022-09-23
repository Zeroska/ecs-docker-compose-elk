# Logstash

Currently Logstash TCP input plugin Using ECS vs so you should check the pre defined field using ECS v1 in the documetation.

The Beat input plugin *NOT* using ECS 
## Environment varibles

- ELASTIC_HOST
- ELASTIC_PASSWORD
- LOGSTASH_USER
- LOGSTASH_PASSWORD

Currently the Logstash is no parsing the log from HDBank correctly I don't know why it doens't but something strange happen, two log from diffent host just
overlap on each other 


## Naming for ITD Index

It should be like this, it is long but it is clear that the application that belong to specific unit and department and who is incharge of that

unit ---- department ---- project ---- application ---- date 

### How can we do such thing

1. First of all the sender or the filebeat must has include the field that indicate their application and project for ust to parse
2. Second they must provide the IP of the server that being managed by which department

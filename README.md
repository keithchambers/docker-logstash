# docker-logstash
Minimal Docker image with Logstash

## Build
```
$ git clone https://github.com/keithchambers/docker-logstash.git
$ cd docker-logstash
$ docker build ./
```

## Run
```
$ git clone https://github.com/keithchambers/docker-logstash.git
$ cd docker-logstash
$ docker run --rm -v $PWD/logstash.conf:/logstash.conf/config keithchambers/docker-logstash
```

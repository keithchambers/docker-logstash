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
$ docker run --rm -v $PWD:/logstash/config keithchambers/docker-logstash
```

## Test
Send a test message with logger
```
$ logger -p 5000 --udp "foo"
```

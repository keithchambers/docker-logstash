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
$ docker run -p 514:514 -v $PWD/logstash.conf:/logstash/config keithchambers/docker-logstash
```

## Configure rsyslog
Add the following line to `/etc/rsyslog.conf` to forward all longs to the logstash container
```
*.* @@<ip-address>:514
```

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
$ docker run --rm -p 5000:5000 -v $PWD/logstash.conf:/logstash.conf/config keithchambers/docker-logstash
```

## Configure rsyslog
Add the following line to `/etc/rsyslog.conf` to forward all longs to the logstash container
```
*.* @@<ip-address>:5000
```

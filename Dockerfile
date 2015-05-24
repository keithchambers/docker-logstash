FROM progrium/busybox

# logstash version
ENV VERSION 1.5.0

# syslog listener
EXPOSE 514/udp

# collectd listener
EXPOSE 25826/udp

# statsd listener
EXPOSE 8125/udp

# install needed packages
RUN opkg-install bash curl grep ca-certificates

# install java
RUN curl -Lskj -b "oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jre-8u40-linux-x64.tar.gz | \
        gunzip -c - | tar xf - -C /opt \
    && rm -rf $(find /opt/ | grep -E "/jre1.8.0_40/lib/(desktop|locale|fonts|plugin)/") \
    && ln -s /opt/jre1.8.0_40/bin/java /usr/bin/java

# install logstash    
RUN curl -Lskj "http://download.elastic.co/logstash/logstash/logstash-$VERSION.tar.gz" | \
        gunzip -c - | tar xf - -C /tmp \
    && mv "/tmp/logstash-$VERSION" /logstash \
    && rm -rf $(find /logstash | egrep "(\.(exe|bat)$|sigar/.*(dll|winnt|x86-linux|solaris|ia64|freebsd|macosx))")

# add logstash configuration
ADD logstash.conf /logstash/config

# create log directory
RUN mkdir /logs

# logstash config
VOLUME ["/logstash/config"]

# logstash certs
VOLUME ["/logstash/certs"]

# logstash certs
VOLUME ["/logs"]

CMD ["/logstash/bin/logstash", "-f", "/logstash/config"]

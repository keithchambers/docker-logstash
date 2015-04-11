FROM progrium/busybox

EXPOSE 5000

ENV LOGSTASH_VERSION 1.5.0.rc2

RUN opkg-install bash curl grep ca-certificates \
    && curl -Lskj -b "oraclelicense=accept-securebackup-cookie" \
            http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jre-8u40-linux-x64.tar.gz | \
            gunzip -c - | tar xf - -C /opt \
    && rm -rf $(find /opt/ | grep -E "/jre1.8.0_40/lib/(desktop|locale|fonts|plugin)/") \
    && ln -s /opt/jre1.8.0_40/bin/java /usr/bin/java \
    && curl -Lskj "http://download.elastic.co/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz" | \
            gunzip -c - | tar xf - -C /tmp \
    && mv "/tmp/logstash-$LOGSTASH_VERSION" /logstash \
    && rm -rf $(find /logstash | egrep "(\.(exe|bat)$|sigar/.*(dll|winnt|x86-linux|solaris|ia64|freebsd|macosx))")

VOLUME ["/logstash/config"]

VOLUME ["/logstash/certs"]

CMD ["/logstash/bin/logstash", "--quiet",  "-f", "/logstash/config/logstash.conf"]

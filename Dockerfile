FROM alpine:3.7

MAINTAINER fofonovrv@gmail.com

RUN apk update \
    && apk add squid=3.5.4-r2 \
    && apk add curl \
    && rm -rf /var/cache/apk/*

COPY start-squid.sh /usr/local/bin/
COPY conf/squid*.conf /etc/squid/

RUN chmod +x /usr/local/bin/start-squid.sh

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/start-squid.sh"]

FROM alpine:3.2

MAINTAINER fofonovrv@gmail.com

RUN apk update \
    && apk add squid=3.5.4-r2 \
    && apk add curl \
    && rm -rf /var/cache/apk/*

COPY start-squid.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/start-squid.sh

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/start-squid.sh"]

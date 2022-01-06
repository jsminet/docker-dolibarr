FROM alpine:3.15

ENV BUILD_DEPS \
 mariadb-client \
 bash

COPY entrypoint.sh /usr/local/bin/

RUN apk update \
 && apk add --no-cache ${BUILD_DEPS} \ 
 && which crond \
 && rm -rf /etc/periodic \
 && chmod +x /usr/local/bin/entrypoint.sh \
 && rm -rf /var/cache/apk/* 

ENTRYPOINT ["entrypoint.sh"]
CMD ["crond", "-f", "-l", "2"]
FROM alpine:3.15

ENV BUILD_DEPS \
 mariadb-client \
 bash

RUN apk update \
 && apk add --no-cache ${BUILD_DEPS} \ 
 && which crond \
 && rm -rf /etc/periodic \
 && rm -rf /var/cache/apk/* 

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["crond", "-f", "-l", "2"]
FROM redis:4.0.8-alpine

MAINTAINER Carrey (jaehun.lee@ticketlink.co.kr)

## Copy Redis File
## 복사/추가 하는파일의 Container내 경로는 항상 절대경로로 작성하여야 한다.
RUN rm -rf /usr/local/bin/docker-entrypoint.sh
ADD redis.conf /usr/local/bin/redis.conf
RUN touch /usr/local/bin/redis.log
ADD docker-entrypoint.sh /usr/local/bin

## change access authority
RUN chmod 755 /usr/local/bin/redis.conf
RUN chmod 755 /usr/local/bin/redis.log
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

RUN chown redis:redis /usr/local/bin/redis.conf
RUN chown redis:redis /usr/local/bin/redis.log
RUN chown redis:redis /usr/local/bin/docker-entrypoint.sh

EXPOSE $CLIENTPORT
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD [ "redis-server","/usr/local/bin/redis.conf" ]

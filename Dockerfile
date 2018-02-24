FROM redis:4.0.8-alpine

MAINTAINER Carrey (jaehun.lee@ticketlink.co.kr)
WORKDIR /usr/local/bin

## Copy Redis File
## 복사/추가 하는파일의 Container내 경로는 항상 절대경로로 작성하여야 한다.
ADD /redis-conf/master.conf /usr/local/bin/redis.conf
RUN touch /usr/local/bin/redis.log

## change access authority
RUN chmod 755 /usr/local/bin/redis.conf
RUN chmod 755 /usr/local/bin/redis.log
RUN chown redis:redis /usr/local/bin/redis.conf
RUN chown redis:redis /usr/local/bin/redis.log

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD [ "redis-server","/usr/local/bin/redis.conf" ]

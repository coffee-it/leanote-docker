FROM alpine:3.8
LABEL maintainer="sergei@coffee-it.org"

COPY ./files/*	/root/


RUN apk add --update --no-cache mongodb mongodb-tools && \
	mkdir /mongodb

EXPOSE 9000
CMD /root/autostart.sh

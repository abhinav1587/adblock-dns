FROM alpine:latest
MAINTAINER ArthurKay
RUN apk -U add dnsmasq
RUN mkdir /etc/badhosts
ADD ./dnsmasq.conf /etc/dnsmasq.conf
ADD ./download/* /etc/badhosts/
RUN chmod 444 /etc/badhosts/*
CMD ["dnsmasq", "--log-facility=/var/log/dnsmasq.log"]

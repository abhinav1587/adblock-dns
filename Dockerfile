FROM alpine:latest
MAINTAINER ArthurKay
RUN apk -U add dnsmasq
RUN mkdir /etc/badhosts
ADD ./download/* /etc/badhosts/
RUN chmod 444 /etc/badhosts/*
CMD ["dnsmasq", "-k", "-b", "-B", "0.0.0.0", "-H", "/etc/badhosts/", "--cache-size=1500"]

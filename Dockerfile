FROM alpine:latest
MAINTAINER ArthurKay
RUN apk -U add dnsmasq
RUN mkdir /etc/badhosts
ADD https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts /etc/badhosts/StevenBlack
ADD ./dnsmasq.conf /etc/dnsmasq.conf
RUN chmod 444 /etc/badhosts/*
CMD ["dnsmasq", "-k"]

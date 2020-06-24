FROM alpine
MAINTAINER ArthurKay

RUN apk -U add dnsmasq && \
mkdir /etc/badhosts && \
wget -P /etc/badhosts https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts && \
dos2unix ./etc/badhosts/* && \
chmod 444 /etc/badhosts/*

CMD ["dnsmasq", "-k", "-b", "-B", "0.0.0.0", "-H", "/etc/badhosts/", "--cache-size=1500"]

FROM alpine:3.2
RUN apk -U add dnsmasq
RUN wget https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -O badhosts
ENTRYPOINT ["dnsmasq", "-k", "-H badhosts"]

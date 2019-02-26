FROM alpine
MAINTAINER ArthurKay

RUN apk -U add dnsmasq && \
mkdir /etc/badhosts && \
wget -P /etc/badhosts http://hosts-file.net/ad_servers.txt && \
wget -P /etc/badhosts http://hosts-file.net/emd.txt && \
wget -P /etc/badhosts http://hosts-file.net/exp.txt && \
wget -P /etc/badhosts http://hosts-file.net/fsa.txt && \
wget -P /etc/badhosts http://hosts-file.net/grm.txt && \
wget -P /etc/badhosts http://hosts-file.net/hjk.txt && \
wget -P /etc/badhosts http://hosts-file.net/mmt.txt && \
wget -P /etc/badhosts http://hosts-file.net/pha.txt && \
wget -P /etc/badhosts http://hosts-file.net/psh.txt && \
dos2unix ./etc/badhosts/* && \
sed -i -r 's/((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])/'"0.0.0.0"'/' ./etc/badhosts/* && \
chmod 444 /etc/badhosts/*

CMD ["dnsmasq", "-k", "-b", "-B", "0.0.0.0", "-H", "/etc/badhosts/", "--cache-size=1500"]

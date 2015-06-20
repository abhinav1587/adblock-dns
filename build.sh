
#!/bin/bash
HOLE=0.0.0.0

mkdir ./download

##HPHOSTS
#advertising
wget -P download http://hosts-file.net/ad_servers.txt

#malware
wget -P download http://hosts-file.net/emd.txt

#browser exploits
wget -P download http://hosts-file.net/exp.txt

#fraud
wget -P download http://hosts-file.net/fsa.txt

#spammers
wget -P download http://hosts-file.net/grm.txt

#abusers of hphosts forums
#wget -P download http://hosts-file.net/hfs.txt

#browser hijackers
wget -P download http://hosts-file.net/hjk.txt

#misleading marketing (fake flash updates, similar trash)
wget -P download http://hosts-file.net/mmt.txt

#illegal pharmacy sites (fake viagra spam?)
wget -P download http://hosts-file.net/pha.txt

#phishing sites
wget -P download http://hosts-file.net/psh.txt

#piracy sites (including ye olde bay)
#we are pirates too! (blocking ads)
#wget -P download http://hosts-file.net/wrz.txt

#file processing
dos2unix ./download/*
sed -i -r 's/((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])/'"$HOLE\t"'/' ./download/*

#build image
docker build -t arthurkay/sagittarius-a .
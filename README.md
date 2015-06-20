# sagittarius-A

Zero-conf docker application that functions as a DNS black hole. Only 6MB in binary size. Based on the excellent image maintained by andyshinn. It is an `ENTRYPOINT` to the `dnsmasq` binary, plus some extra mojo to build a list of hosts to "accidentally" mis-resolve. Using Steven Black's list for testing, and trusting its addresses. Final version will work without trust, using arbitrary lists of domains to block or redirect (for logging). Whether or not to ship a server container is currently up in the air, but odds are someone already has one.

## Building
`docker build -t arthurkay/sagittarius-a .`
`docker run -p 53:53/tcp -p 53:53/udp --cap-add=NET_ADMIN arthurkay/sagittarius-a`

To add a hosts file to the list, create a line in Dockerfile similar to ADD SOMEADDRESS /etc/badhosts/SOMENAME
Currently the built image is under 10MB, and requires just 6MB of RAM to run.

Altering the dnsmasq.conf will alter the final configuration. No commands necessary to pass to the container, just make sure you're exposing the ports to your host and that they are world-reachable.

## Usage Notes

[dnsmasq][dnsmasq] requires `NET_ADMIN` capabilities to run correctly.

Configuration of the black hole is handled at build-time. See the above section.

[dnsmasq]: http://www.thekelleys.org.uk/dnsmasq/doc.html

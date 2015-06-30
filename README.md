# sagittarius-A

Zero-conf docker application that functions as a DNS black hole. Only 6MB in binary size. Based on the excellent image maintained by andyshinn.
Functions without trust, replacing IP addresses in the input with a single build-time configurable address.

## Building
`docker build -t arthurkay/sagittarius-a .`

`docker run -p 53:53/tcp -p 53:53/udp --cap-add=NET_ADMIN arthurkay/sagittarius-a`

To add a hosts file to the list, load one into ./downloads using wget or curl in build.sh
Currently the build image is <50MB, and requires <50MB to run.

Altering the dnsmasq.conf will alter the final configuration. No commands necessary to pass to the container, just make sure you're exposing the ports to your host and that they are world-reachable.

## Usage Notes

[dnsmasq][dnsmasq] requires `NET_ADMIN` capabilities to run correctly.

Configuration of the black hole is handled at build-time. See the above section.

Running deploy.sh will provide a working container.

[dnsmasq]: http://www.thekelleys.org.uk/dnsmasq/doc.html

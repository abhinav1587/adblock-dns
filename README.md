# sagittarius-a

Zero-conf docker application that functions as a DNS black hole. Only 6MB in binary size. Based on the excellent image maintained by andyshinn. It is an `ENTRYPOINT` to the `dnsmasq` binary, plus some extra mojo to build a list of hosts to "accidentally" mis-resolve. Using Steven Black's list (hard set) for testing, and trusting its addresses. Final version will work without trust, using arbitrary lists of domains to block or redirect (for logging).

## Usage

[dnsmasq][dnsmasq] requires `NET_ADMIN` capabilities to run correctly. Start it with something like `docker run -p 53:53/tcp -p 53:53/udp --cap-add=NET_ADMIN andyshinn/dnsmasq`.

The configuration is all handled on the command line (no wrapper scripts here). The `ENTRYPOINT` is `dnsmasq -k` to keep it running in the foreground. If you wanted to send requests for an internal domain (such as Consul) you can forward the requests upstream using something like `docker run -p 53:53/tcp -p 53:53/udp --cap-add=NET_ADMIN andyshinn/dnsmasq -S /consul/10.17.0.2`. This will send a request for `redis.service.consul` to `10.17.0.2`

[dnsmasq]: http://www.thekelleys.org.uk/dnsmasq/doc.html

### Socator is SOCAT + TOR

Socator container uses socat to listen on a given TCP port and to redirect incoming traffic to a tor hidden service specified through environment variables. As such it kind of acts as a relay between the standard web and a hidden service on the tor network.

You can optionnally restrict the IP addresses that are allowed to connect to this service by specifying an `ALLOWED_RANGE` environment variable and using CIDR notation.

Examples
--------------

build

    docker build -t socator .

To start the image in background (*daemon mode*) with IP address restriction:

    docker run -d -p 5000:5000 -e "ALLOWED_RANGE=192.168.1.0/24" -e "TOR_SITE=facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion" -e "TOR_SITE_PORT=443" --name socator socator

To start the image in foreground:

    docker run --rm -ti -p 5000:5000 -e "TOR_SITE=zqktlwi4fecvo6ri.onion" -e "TOR_SITE_PORT=80" --name socator socator

facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion


You can then browse to the main page using `http://your_container_public_ip/` and you'll get forwarded to the tor hidden service



# Start socat
if [ -z "${ALLOWED_RANGE}" ]; then
	socat TCP-L:5000,fork,reuseaddr SOCKS5:127.0.0.1:${TOR_SITE}:${TOR_SITE_PORT},socksport=9050
else
	socat TCP-L:5000,fork,reuseaddr,range=${ALLOWED_RANGE} SOCKS5:127.0.0.1:${TOR_SITE}:${TOR_SITE_PORT},socksport=9050
fi

/usr/bin/socat tcp4-LISTEN:$PORT,reuseaddr,fork,keepalive,bind=$IP SOCKS4A:127.0.0.1:$URL_ONION:$PORT_ONION,socksport=9050



docker run -it socator ash
docker run --rm -ti -p 5000:5000 -e "TOR_SITE=zqktlwi4fecvo6ri.onion" -e "TOR_SITE_PORT=80" --name socator socator ash


docker run --rm -ti -p 5000:5000 -e "TOR_SITE=zqktlwiuavvvqqt4ybvgvi7tyo4hjl5xgfuvpdf6otjiycgwqbym2qad.onion" -e "TOR_SITE_PORT=80" --name socator socator ash
docker run --rm -ti -p 5000:5000 -e "TOR_SITE=zqktlwiuavvvqqt4ybvgvi7tyo4hjl5xgfuvpdf6otjiycgwqbym2qad.onion" -e "TOR_SITE_PORT=80" --name socator socator

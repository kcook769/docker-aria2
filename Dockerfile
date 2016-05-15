FROM debian:latest
MAINTAINER kevin.t.cook@gmail.com

RUN apt-get update && apt-get install -y aria2 \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 6800 

CMD ["/usr/bin/aria2c", "--enable-rpc", "--rpc-listen-all", "--dir=/data", "--seed-time=0", "--bt-require-crypto=true", "--bt-max-peer=100", "--bt-min-crypto-level=arc4", "--listen-port=6890-6999", "--max-overall-upload-limit=50K", "--conf-path=/data/aria.config", "--rlimit-nofile=10000", "--max-download-limit=70M", "--save-session=/data/aria.sesion", "--http-accept-gzip=true", "--enable-http-pipelining=true", "--save-cookies=/data/aria.cookies"]


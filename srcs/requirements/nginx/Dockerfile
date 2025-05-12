FROM debian:bullseye

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y nginx openssl && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/entrypoint.sh /home/flmuller/entrypoint.sh
RUN chmod +x /home/flmuller/entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/home/flmuller/entrypoint.sh"]

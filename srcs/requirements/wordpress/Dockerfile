FROM debian:bullseye

# Installer les dépendances nécessaires
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        php php-fpm php-mysql mariadb-client wget unzip less iputils-ping netcat \
        curl php-curl php-dom php-mbstring php-imagick php-gd php-xml php-zip php-intl \
        && apt-get clean && rm -rf /var/lib/apt/lists/*


COPY tools/entrypoint.sh /usr/local/entrypoint.sh
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod +x /usr/local/entrypoint.sh
RUN mkdir -p /run/php


EXPOSE 9000
ENTRYPOINT ["/usr/local/entrypoint.sh"]
FROM alpine:3.6
LABEL maintainer="Benedikt Franke <benedikt.franke@zoho.com>"
LABEL version="0.1.0"
LABEL description="An alpine based container with apache2 and php as an apache module"

RUN apk --update add \
                    apache2 \
                    php5-apache2

RUN mkdir /run/apache2
RUN mkdir /var/www/public
RUN echo "<?php phpinfo() ?>" > /var/www/public/index.php

COPY httpd.conf /etc/apache2/httpd.conf

EXPOSE 80

VOLUME ["/var/www"]

WORKDIR /var/www

CMD ["httpd", "-D", "FOREGROUND"]
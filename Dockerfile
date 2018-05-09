FROM quay.io/yeebase/nginx-php-fpm:php71

RUN apt-get update
RUN apt-get install vim -y

#COPY --chown=1001:1001  /app /app

COPY ./app/composer.json /app/composer.json

RUN apt-get install composer -y
RUN composer install -d /app

RUN rm -rf /var/www && ln -s /app/Web /var/www && rm -Rf /app/Data/Temporary
#&& \
#    cp /app/Configuration/Development/Settings.yaml /app/Configuration/Settings.yaml && \
#    cp /app/Configuration/Development/Caches.yaml /app/Configuration/Caches.yaml

COPY ./app/Configuration/Settings.yaml /app/Configuration/Settings.yaml
COPY ./app/Configuration/Caches.yaml /app/Configuration/Caches.yaml
COPY ./default.conf /etc/nginx
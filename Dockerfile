FROM quay.io/yeebase/nginx-php-fpm:php71

RUN apt-get update
RUN apt-get install vim -y

COPY --chown=1001:1001  /app /app

#COPY ./app/ /app/
RUN apt-get install zip -y
#RUN apt-get install composer -y
#RUN composer install -d /app
RUN apt-get update
RUN apt-get install imagemagick -y
RUN apt-get install  python-software-properties software-properties-common -y
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get install php-imagick -y

RUN rm -rf /var/www && ln -s /app/Web /var/www && rm -Rf /app/Data/Temporary
#&& \
#    cp /app/Configuration/Development/Settings.yaml /app/Configuration/Settings.yaml && \
#    cp /app/Configuration/Development/Caches.yaml /app/Configuration/Caches.yaml

#COPY ./app/Configuration/Settings.yaml /app/Configuration/Settings.yaml
#COPY ./app/Configuration/Caches.yaml /app/Configuration/Caches.yaml
COPY ./default.conf /etc/nginx/sites-enabled/
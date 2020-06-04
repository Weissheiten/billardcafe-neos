#FROM yeebase:7.4
FROM quay.io/yeebase/neos-base:7.3

COPY /DockerBuildConfFiles/nginx /etc/nginx

RUN apt-get update
RUN apt-get install vim -y

COPY --chown=33:33 /app /app

RUN apt-get install zip -y --allow-unauthenticated
##RUN apt-get install composer -y
##RUN composer install -d /app
RUN apt-get update
RUN apt-get install imagemagick -y --allow-unauthenticated
RUN apt-get install php7.3-imagick -y --allow-unauthenticated
#RUN apt-get install -y software-properties-common

COPY /DockerBuildConfFiles/policy.xml /etc/ImageMagick-6/policy.xml

RUN rm -rf /var/www && ln -s /app/Web /var/www && rm -Rf /app/Data/Temporary

RUN mkdir /tmp/php

#&& \
#    cp /app/Configuration/Development/Settings.yaml /app/Configuration/Settings.yaml && \
#    cp /app/Configuration/Development/Caches.yaml /app/Configuration/Caches.yaml

#COPY ./app/Configuration/Settings.yaml /app/Configuration/Settings.yaml
#COPY ./app/Configuration/Caches.yaml /app/Configuration/Caches.yaml
#COPY ./default.conf /etc/nginx/sites-enabled/
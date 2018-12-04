FROM quay.io/yeebase/neos-base:7.2

RUN apt-get update
RUN apt-get install vim -y

COPY --chown=33:33 /app /app

RUN apt-get install zip -y
##RUN apt-get install composer -y
##RUN composer install -d /app
RUN apt-get update
RUN apt-get install imagemagick -y
RUN apt-get install php7.2-imagick -y
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
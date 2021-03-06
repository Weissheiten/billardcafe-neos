# Docker based development setup

This setup is based on the work of Benedikt Schmitz (https://github.com/egobude/docker-neos-template)

Template for a docker based Neos CMS development setup.

## Links

 * [Neos CMS - Open Source Content Application Platform](https://www.neos.io/)
 * [Flow Framework - PHP web application framework](https://flow.neos.io/)

## Requirements

* docker (https://docs.docker.com/engine/installation)
* docker-compose (https://docs.docker.com/compose)
* composer (https://getcomposer.org)

## How to start

### Clone the repository

    git clone https://github.com/egobude/docker-neos-template.git
    
### Install the project

    cd docker-neos-template
    composer update
    
### Start up your docker-compose file

    docker-compose up -d
    
After that your project should be up and running. You can reach your project under http://<YOUR_IP_ADRESS:32831

## General tips

### How to change the port?

If you want to change the port you have to do this in the [docker-compose.yml](https://github.com/egobude/docker-neos-template/blob/master/docker-compose.yml) file and in the Nginx configuration under [Configuration/Docker/default.conf](https://github.com/egobude/docker-neos-template/blob/master/Configuration/Docker/default.conf)

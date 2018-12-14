# Nginx php7-fpm Docker

This is a Dockerfile to build a container image consisting of nginx, php-fpm and composer.

### Docker hub repository
The Docker hub build can be found here: [https://hub.docker.com/r/dwdraju/dockerfiles:nginx-phpfpm70/](https://hub.docker.com/r/dwdraju/dockerfiles/)

## Pulling from Docker Hub
Pull the image from docker hub:
```
docker pull dwdraju/dockerfiles:nginx-phpfpm70
```

## Running
To simply run the container:
```
docker run --name app -p 8080:80 dwdraju/dockerfiles:nginx-phpfpm70
```

You can then browse to ```http://<HOST>:8080``` to view the default install files.

### Volumes
If you want to link to your web site directory on the docker host to the container run:
```
docker run --name mypvapp -p 8080:80 -v /your_code_directory:/var/www -d dwdraju/dockerfiles:nginx-phpfpm70
```
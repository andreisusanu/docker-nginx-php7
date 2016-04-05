[![](https://badge.imagelayers.io/andreisusanu/nginx-php7:latest.svg)](https://imagelayers.io/?images=andreisusanu/nginx-php7:latest)

nginx-php7
==========

Docker image for NGINX and PHP7, started using Supervisor.

Last stable NGINX installed from official stable repository (http://ppa.launchpad.net/nginx/stable/ubuntu)
Last PHP7 installed from Ondřej Surý's unofficial repository (http://ppa.launchpad.net/ondrej/php/ubuntu)

Build image
-----------

```bash
docker build -t andreisusanu/nginx-php7 .
```


Run container
-------------
```bash
docker run \
    --name nginx-php7 \
    -p 8000:80 \
    -v /path/to/local/www:/var/www/html \
    andreisusanu/nginx-php7
```


Test container
--------------
```bash
http://localhost:8000/
```


Run bash on container (for debug)
---------------------------------
```bash
docker exec -it nginx-php7 bash
```

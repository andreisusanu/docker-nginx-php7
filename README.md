[![](https://badge.imagelayers.io/andreisusanu/nginx-php7:latest.svg)](https://imagelayers.io/?images=andreisusanu/nginx-php7:latest)

nginx-php7
==========

Docker image for Ubuntu Xenial, NGINX and PHP7.
Supervisor is used to start services (php7.0-fpm and nginx).


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

nginx-php7
=============

Docker image for NGINX and PHP7, started using Supervisor.

Last stable NGINX installed from official stable repository (http://ppa.launchpad.net/nginx/stable/ubuntu)
Last PHP7 installed from Ondřej Surý's unofficial repository (http://ppa.launchpad.net/ondrej/php/ubuntu)


Build
-----

```bash
docker build -t andreisusanu/nginx-php7 .
```


Run
-----
```bash
docker run \
    --name nginx-php7 \
    -p 80:80 \
    andreisusanu/nginx-php7
```
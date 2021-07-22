## PROD
`Docker version 18.06.1-ce, build e68fc7a`

`docker-compose version 1.22.0, build f46880fe`


### BUILD and PUSH conainters
#### Backend
```
$ cd epicfailstudio/laravel-php-backend
$ docker build --no-cache --tag epicfailstudio/laravel-php-backend:7.4php ./
$ docker push epicfailstudio/laravel-php-backend:7.4php
```

#### Scheduler
```
$ cd _epicfailstudio/laravel-php-scheduler
$ docker build --no-cache --tag epicfailstudio/laravel-php-scheduler:7.4php ./
$ docker push epicfailstudio/laravel-php-scheduler:7.4php
```

### Helper links
https://docs.docker.com/engine/swarm/stack-deploy/

https://github.com/swarmpit/swarmpit

https://docs.docker.com/registry/deploying/

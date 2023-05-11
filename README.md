# Dockerized PHP skeleton

PHP skeleton to realize simple katas

# Dependencies

You will need:
- Docker and docker-compose installed on your system

Also, If you want to manage composer dependencies from the host machine:
- composer installed on your system, or composer.phar, both downloadable from [ this link ](https://getcomposer.org/download/)

# Usage

To generate the image, run:
```
docker-compose up --build -d
docker exec -it php-skeleton composer install
```

Once it's generated, to get the container up and running you only need to do:
```
docker-compose up -d
```

If you want to stop the container:
```
docker-compose down
```

To launch the tests, run:
```
docker exec -it php-skeleton vendor/bin/phpunit tests
```

To log into the running container, run:
```
docker exec -it php-skeleton bash
```

You will find the contens of the project available from the host machine at: `http://localhost:8123`


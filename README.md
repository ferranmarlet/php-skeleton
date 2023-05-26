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
make build
```

Once it's generated, to get the container up and running you only need to do:
```
make up
```

If you want to stop the container:
```
make down
```

To launch the tests, run:
```
make tests
```

To log into the running container, run:
```
make sh
```

You will find the contens of the project available from the host machine at: `http://localhost:8123`


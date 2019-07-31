# Setup

Optional: Chreate `.env` from `.env-example` file and ensure database config is the same as the one in `docker-compose.yml`. Then build and run the containers:

```
docker-compose build
docker-compose up -d
```

Login in laravel-env container:

If you use git bash the command will look like:

```
# replace <container> with the coresponding id/name, check it with "docker ps" command
winpty docker exec -it <container-id> bash
```

Then run these commands:
```
composer install --prefer-dist
```


# Commands

```
docker-compose up -d # -d is used to start in background

docker-compose stop # just stop
docker-compose down # stop and remove container data

docker-compose logs -f # all containers
docker-compose logs <container-id> -f # single container

winpty docker exec -it <container-id> bash # log in container, winpty is for git bash
```

# Create project
```
Create laravel project and move the files to the current directory

# laravel
composer create-project --prefer-dist laravel/laravel my-project

# symfony
wget https://get.symfony.com/cli/installer -O - | bash
export PATH="$HOME/.symfony/bin:$PATH"
symfony new --full my_project
```

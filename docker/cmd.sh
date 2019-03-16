# add config
. .env

COMMAND=$1
CONTAINER=$(docker ps | grep $DOCKER_IMAGE | cut -c1-12)

echo "container: $CONTAINER"

if [ "$COMMAND" == "-h" ] || [ "$COMMAND" == "--help" ] || [ "$COMMAND" == "" ]; then
    echo "Docker container management"
    echo ""
    echo "Commands:"
    echo "  build - build the image"
    echo "  run - run the image"
    echo "  status - running, stopped"
    echo "  stop - stop the container"
    echo "  logs - tail logs"
    echo "  bash - login into bash shell"
    exit
fi

if [ "$COMMAND" == "build" ]; then
    docker build -t $DOCKER_IMAGE .
    exit
fi

if [ "$COMMAND" == "run" ]; then
    if [ "$CONTAINER" != "" ]; then
        echo "Already running, needs to be stopped first"
    else
        docker run -d \
            --restart=always \
            -v $(pwd)/../public-html/:/var/www/html/ \
            --env-file .env \
            -p $PORT:80 \
            $DOCKER_IMAGE
        echo ""
        echo "Service started on port $PORT"
    fi
    exit
fi

if [ "$COMMAND" == "status" ]; then
    if [ "$CONTAINER" != "" ]; then
        echo "running"
    else
        echo "stopped"
    fi
    exit
fi

if [ "$CONTAINER" == "" ]; then
    echo "error - container is not running"
    exit
fi

if [ "$COMMAND" == "stop" ]; then
    docker update --restart=no $CONTAINER > /dev/null
    docker stop $CONTAINER > /dev/null
    exit
fi

if [ "$COMMAND" == "logs" ]; then
    docker logs $CONTAINER -f
    exit
fi

if [ "$COMMAND" == "bash" ]; then
    docker exec -it $CONTAINER bash
    exit
fi

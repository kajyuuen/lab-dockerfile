# How to Use
0;95;0c
## Docker Compose

```shell
$ source ./env_set.sh
$ docker-compose build
$ docker-compose up
```

## Docker Only

```
$ source ./env_set.sh
$ docker build . -t $IMAGE_NAME
$ docker run -itd --name $CONTAINER_NAME -v $HOST_DIRECTORY:$CONTAINER_DIRECTORY -p $HOST_PORT:8888 $IMAGE_NAME jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --notebook-dir=$CONTAINER_DIRECTORY
```

**パスワードの確認**

```
$ docker logs $CONTAINER_NAME
```
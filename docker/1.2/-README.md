# How to run
```sh
docker build --file server.Dockerfile --tag my-first-server .
# --file  : Run a specific dockerfile (instead of the last dockerfile)
# --tag   : Name the server
# .       : Build from the current directory

docker run my-first-server
# server runs on terminal continuously and we cannot command termial anymore!

# open a new terminal
docker ps # get container-id

docker run -d my-first-server
# start server in detached mode (So, you can controll the terminal!)

# In order to run additional commands in container
docker exec <container-id> <command>

# Run interactive commands in a running container
docker exec --interactive --tty <container-id> # shortly: docker exec -it <container-id>

# Stop a running server gracefully
docker stop <container-id>          # it can take time
docker stop -t 0                    # it can cause data-loss
docker kill <container-id>          # shut down the container immediately

docker ps -aq                       # list only the id of the containers
docker ps -aq | xargs docker rm     # remove all Docker containers (stopped and running)
# -a:     all instances
# -q:     quiet (shows only the ids of the containers)
# xargs:  takes the received IDs and passes them as arguments to the following command
# rm:     remove
```

```sh
# List images
docker images
docker rmi <image-id>
docker rmi -f <image-id>
```
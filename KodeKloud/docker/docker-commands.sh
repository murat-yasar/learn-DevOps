# IMAGES

# docker images
# This command lists all Docker images on the local machine.
docker images

# docker pull <image>
# This command pulls a Docker image from a registry (like Docker Hub).
docker pull nginx:latest

# docker build -t <image_name> .
# This command builds a Docker image from a Dockerfile in the current directory.
docker build -t my-image .

# docker rmi <image>
# This command removes a Docker image.
docker rmi nginx:latest



# CONTAINERS

# docker run <image> 
# This command is used to create and start a container from the specified image.
docker run nginx:latest

# Create and start a container with a specific name "webapp".
docker run -d --name webapp nginx:1.14-alpine
# -d: Runs the container in detached mode (in the background).
# --name: Assigns a name to the container for easier reference.

# docker ps
# This command lists all running containers.
docker ps

# docker ps -a
# This command lists all containers, including those that are stopped.
docker ps -a

# docker stop <container_id>
# This command stops a running container.
docker stop <container_id>

# docker rm <container_id>
# This command removes a stopped container.
docker rm <container_id>



# COMMANDS

# docker exec -it <container_id> <command>
# This command executes a command inside a running container.
docker exec -it <container_id> /bin/bash
# -i: Interactive mode
# -t: Allocate a pseudo-TTY
# Example: Start a bash shell in the container.

# Assigns port 80 on the host to port 5000 in the container.
docker run -p 80:5000 Kodekloud/webapp
# -p: Maps a port on the host to a port in the container.

# docker run -v <host_path>:<container_path> <image>
# This command mounts a volume from the host to the container. 
# So that data can persist even if the container is removed.
docker run -v /opt/datadir:/var/lib/mysql mysql
# -v: Mounts a volume from the host to the container.

# docker inspect <container_id>
# This command retrieves detailed information about a container or image.
docker inspect <container_id>

# docker logs <container_id>
# This command retrieves the logs from a running or stopped container.
docker logs <container_id>
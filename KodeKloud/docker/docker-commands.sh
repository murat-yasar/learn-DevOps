##################
##### IMAGES #####
##################

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

# Creating own image of flask from a Dockerfile
# 1. Install OS
# 2. Uptade apt repository
# 3. Install dependencies 
# 4. Install Python dependencies
# 5. Copy application files to /opt folder
# 6. Run the web server using flask

# Example Dockerfile:
# FROM ubuntu
# RUN apt-get update 
# RUN apt-get install -y python3 && python3-pip
# RUN pip install flask
# RUN pip install flask-mysql
# COPY . /opt/my-flask-app
# ENTRYPOINT FLASK_APP=/opt/my-flask-app/app.py flask run

docker build dockerfile -t myasar/my-flask-app
docker push myasar/my-flask-app


# Environment Variables
# docker run -e <key>=<value> <image>
# This command sets environment variables in the container.
docker run -p 38282:8080 --name blue-app -e APP_COLOR=blue -d myasar//my-web-app
# -p: Maps a port on the host to a port in the container.
# -e: Sets an environment variable in the container.
# -d: Runs the container in detached mode (in the background).
docker run -d -e MYSQL_ROOT_PASSWORD=db_pass123 --name mysql-db mysql
docker exec -it mysql-db env



######################
##### CONTAINERS #####
######################

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


####################
##### COMMANDS #####
####################

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
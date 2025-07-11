# var/lib/docker # This is the default directory where Docker stores its data, including images, containers, and volumes.

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
# -t: Specifies the name and optionally a tag for the image.

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





#####################
### DOCKER ENGINE ###
#####################

# This command limits the container to use only 0.5 CPU cores.
docker run --cpus=.5 ubuntu

docker run --memory=512m ubuntu
# This command limits the container to use only 512 MB of memory.




#################
#### VOLUMES ####
#################

docker run -v data_volume:/var/lib/mysql mysql
# This command mounts a named volume "data_volume" to the container's /var/lib/mysql
# -v: Mounts a volume from the host to the container.

docker run -v /opt/data:/var/lib/mysql -d --name mysql-db -e MYSQL_ROOT_PASSWORD=db_pass123 mysql
# This command mounts a host directory /opt/data to the container's /var/lib/mysql
# -v: Mounts a volume from the host to the container.
# -d: Runs the container in detached mode (in the background).
# -e: Sets an environment variable in the container.




#################
#### NETWORK ####
#################

docker run --name alpine-2 --network=none alpine
# This command runs a container named "alpine-2" in the "none" network mode, which means it has no network connectivity.

docker network ls
# This command lists all Docker networks.

docker network create my_network
# This command creates a new Docker network named "my_network".
# Example: Create a network for a web application and a database to communicate.
docker network create --driver bridge --subnet 182.18.0.0/24 --gateway 182.18.0.1 wp-mysql-network
# This command creates a new Docker network named "wp-mysql-network" with a custom bridge driver, subnet, and gateway.
# --driver: Specifies the network driver to use (in this case, "bridge").
# --subnet: Specifies the subnet for the network.
# --gateway: Specifies the gateway for the network.

docker network inspect my_network
# This command retrieves detailed information about the "my_network".
# Example: Inspect the network to see which containers are connected to it.
docker network inspect wp-mysql-network

docker run -d -e MYSQL_ROOT_PASSWORD=db_pass123 --name mysql-db --network wp-mysql-network mysql:5.7
# This command runs a MySQL container named "mysql-db" in the "wp-mysql-network" network with a specified root password.

docker run --network=wp-mysql-network -e DB_Host=mysql-db -e DB_Password=db_pass123 -p 38080:8080 --name webapp --link mysql-db:mysql-db -d myasar/my-webapp-mysql
# This command runs a web application container named "webapp" in the "wp-mysql-network" network, linking it to the "mysql-db" container.
# --network: Specifies the network to connect the container to.
# -e: Sets environment variables in the container (e.g., DB_Host and DB_Password).
# -p: Maps a port on the host to a port in the container (38080 on the host to 8080 in the container).
# --name: Assigns a name to the container for easier reference.
# --link: Links the "webapp" container to the "mysql-db" container, allowing them to communicate.
# -d: Runs the container in detached mode (in the background).
# myasar/my-webapp-mysql: This is the image used for the web application, which is designed to connect to a MySQL database.

docker network connect my-network my-container
# This command connects an existing container "my-container" to the "my-network" network.
docker network disconnect my-network my-container
# This command disconnects the "my-container" from the "my-network" network.




#######################
### DOCKER REGISTRY ###
#######################

docker run -d -p 5000:5000 --restart=always --name my-registry registry:2
# This command runs a Docker registry container named "my-registry" on port 5000.
# -d: Runs the container in detached mode (in the background).
# -p: Maps port 5000 on the host to port 5000 in the container.
# --restart=always: Ensures the container restarts automatically if it stops or if the Docker daemon restarts.
# registry:2: This is the Docker image for the registry, which is the official Docker registry image version 2.


docker pull nginx:latest
# This command pulls the latest version of the Nginx image from Docker Hub.
docker image tag nginx:latest localhost:5000/nginx:latest
# This command tags the Nginx image with a new name that points to the local registry.
# localhost:5000/nginx:latest: This is the new name for the image, indicating that it should be pushed to the local registry running on port 5000.
docker push localhost:5000/nginx:latest
# This command pushes the tagged Nginx image to the local Docker registry at localhost:5000.
# After this command, the Nginx image will be available in the local registry, and you can pull it from there using the command:
# docker pull localhost:5000/nginx:latest
# This command pulls the Nginx image from the local registry instead of Docker Hub.
# This is useful for testing or using images in a private registry without relying on external sources.

docker image prune -a
# This command removes all unused Docker images from the local machine.
# -a: Removes all unused images, not just dangling ones.

docker pull [server-addr/image-name]
# This command pulls a Docker image from a specified server address.
# Example: Pull an image from a private registry at server-addr.
docker pull localhost:5000/nginx
# This command pulls the Nginx image from the local registry running on port 5000.

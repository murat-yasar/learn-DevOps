# Creating Ports

```sh
# Build an image from a dockerfile
docker build -t my-web-server -f web-server.Dockerfile .
# -t:   tag the server
# -f:   reference the dockerfile to create the image
# . :   set the context (the directory where the commands are going to work)

# Run the container
docker run -d --name my-web-server my-web-server # not visible on browser without mapping

# See what's happening
docker logs my-web-server

# Stop and remove the container
docker stop my-web-server && docker rm my-web-server
docker rm -f my-web-server
```
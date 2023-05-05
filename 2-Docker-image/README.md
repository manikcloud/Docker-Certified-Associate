# Docker Image for Custom HTTPD Server

This Docker image is based on the `varunmanik/httpd:cicd` image and serves a custom `index.html` file.

## Dockerfile

The Dockerfile is as follows:

```Dockerfile
FROM varunmanik/httpd:cicd
LABEL maintainer="Varun Manik"

COPY ./index.html /usr/local/apache2/htdocs/

EXPOSE 80
```

## Usage

1. **Build the Docker image:**

   ```
   docker build -t my-custom-httpd .
   ```

2. **Run the Docker container:**

   ```
   docker run -d -p 80:80 --name my-httpd my-custom-httpd
   ```

3. **Access the custom HTTPD server:**

   Open your browser and visit `http://localhost`.

## Stopping the Container

To stop the running container, execute the following command:

```
docker stop my-httpd 
```

## Removing the Container

To remove the stopped container, execute the following command:

```
docker rm my-httpd
```
---------------------------------------------------------------

## 2.3 Images and Containers
This section will guide you to:
- Pull an image and create a new container

### Step 2.3.1: Pulling an image
1. Pull an image using the command:
   sudo docker pull nginx
2. List all the docker images to check the newly pulled nginx image:
   sudo docker images

### Step 2.3.2: Creating a new container
1. Create a new container from the nginx image:
   sudo docker run -dt -p 80:80 nginx
2. List all the running containers to check the newly created container:
   sudo docker ps

### Step 2.3.3: Stopping the container
1. Use the following command to stop the running container:
   sudo docker stop CONTAINER_NAME
   Note: Replace CONTAINER_NAME with the name of the newly created container. In this case CONTAINER_NAME is sweet_brown
2. Use the following command to list all the running containers and verify if the container has stopped running:
   sudo docker ps

3. You can start the container again and check the running containers:
   sudo docker start CONTAINER_NAME
   Note: Replace CONTAINER_NAME with the name of the newly created container. In this case CONTAINER_NAME is sweet_brown
   sudo docker ps

### Step 2.3.4: Deleting the container
1. Stop the running container and remove it using the following commands:
   sudo docker stop CONTAINER_NAME
   sudo docker container rm CONTAINER_NAME
   Note: Replace CONTAINER_NAME with the name of the newly created container. In this case CONTAINER_NAME is sweet_brown

### Step 2.3.5: Removing the image
1. Remove the image using the command:
   sudo docker image rm nginx

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

# Disclaimer
<details>

Please note that the entire repository is owned and maintained by [Varun Kumar Manik](https://www.linkedin.com/in/vkmanik/). While every effort has been made to ensure the accuracy and reliability of the information and resources provided in this repository, Varun Kumar Manik takes full responsibility for any errors or inaccuracies that may be present.

Simplilearn is not responsible for the content or materials provided in this repository and disclaims all liability for any issues, misunderstandings, or claims that may arise from the use of the information or materials provided. By using this repository, you acknowledge that Varun Kumar Manik is solely accountable for its content, and you agree to hold Simplilearn harmless from any claims or liabilities that may arise as a result of your use or reliance on the information provided herein.

It is important to understand that this repository contains educational materials for a training course, and users are expected to apply their own judgment and discretion when utilizing the provided resources. Neither Varun Kumar Manik nor Simplilearn can guarantee specific results or outcomes from following the materials in this repository.

</details>

## Connect & Follow

For more info, please connect and follow me:

- Github: [https://github.com/manikcloud](https://github.com/manikcloud)
- LinkedIn: [https://www.linkedin.com/in/vkmanik/](https://www.linkedin.com/in/vkmanik/)
- Email: [varunmanik1@gmail.com](mailto:varunmanik1@gmail.com)
- Facebook: [https://www.facebook.com/cloudvirtualization/](https://www.facebook.com/cloudvirtualization/)
- YouTube: [https://bit.ly/32fknRN](https://bit.ly/32fknRN)
- Twitter: [https://twitter.com/varunkmanik](https://twitter.com/varunkmanik)
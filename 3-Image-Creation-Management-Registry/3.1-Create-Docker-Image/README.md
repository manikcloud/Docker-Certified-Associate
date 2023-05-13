## Lesson 3 Demo 1: Create a Docker Image

This section will guide you to:
- Create a Docker image using the Dockerfile

### Step 1: Create the Dockerfile
1. Create a directory:
```
   
   mkdir demo
   cd demo
```

2. Create the Dockerfile:
```

   vi Dockerfile
```


3. Add the following code to the Dockerfile:
```
   
# Use Ubuntu as the base image
FROM ubuntu

# Update the package list
RUN apt-get update

# Install nginx
RUN apt-get install -y nginx

# Copy the custom index.html file to the default nginx directory
COPY index.nginx-debian.html /var/www/html/index.nginx-debian.html

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

```
   

   Note: After writing the above code in the Dockerfile, press ESC button and enter :wq to save the file and exit the editor.

4. Create another file in the same directory:
```

   vi index.nginx-debian.html
```


5. Add the following welcome message to the index file:
   WELCOME TO NGINX.

   Note: After writing the above code in the html file, press ESC button and enter :wq to save the file and exit the editor.

### Step 2: Execute the file
1. Execute the Dockerfile (note that there is space between build and .):
   ```
   
    sudo  docker build .
   ```
   
    
2. List the images to check the newly created Docker image:
   ```
    sudo  docker images
   ```
   
    
### Step 3: Running a container from the newly created image

1. Get the image ID of the newly created image:
   ```
    sudo  docker images
   ```
   
    
   Note the IMAGE ID of the newly created image.

2. Run a container from the newly created image:
   ```
    sudo  docker run -d -p 8080:80 IMAGE_ID
   ```
   
    
   Replace IMAGE_ID with the ID of the newly created image.

3. Open a web browser and navigate to http://localhost:8080 to see the "WELCOME TO NGINX" message.

### Step 4: Stop and remove the container

1. List all running containers:
   ```
    sudo  docker ps
   ```
   
    
   Note the CONTAINER ID of the container running the newly created image.

2. Stop the container:
   ```
    sudo  docker stop CONTAINER_ID
   ```
   
    
   Replace CONTAINER_ID with the ID of the running container.

3. Remove the container:
   ```
    sudo  docker rm CONTAINER_ID
   ```
   
    
   Replace CONTAINER_ID with the ID of the stopped container.

### Step 5: Push the image to Docker Hub (Optional)

1. Log in to Docker Hub:
   ```
    sudo  docker login
   ```
   
    
   Enter your Docker Hub username and password when prompted.

2. Tag the image with your Docker Hub username and a tag name:
   ```
    sudo  docker tag IMAGE_ID DOCKER_HUB_USERNAME/IMAGE_NAME:TAG_NAME
   ```
   
    
   Replace IMAGE_ID with the ID of the newly created image, DOCKER_HUB_USERNAME with your Docker Hub username, IMAGE_NAME with the name you want to give your image, and TAG_NAME with the tag you want to assign.

3. Push the tagged image to Docker Hub:
   ```
    sudo  docker push DOCKER_HUB_USERNAME/IMAGE_NAME:TAG_NAME
   ```
   
    
   Replace DOCKER_HUB_USERNAME, IMAGE_NAME, and TAG_NAME with the appropriate values as mentioned in the previous step.

Your Docker image is now available on Docker Hub and can be pulled and used by others.

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